local function get_api_key()
  -- Priority: 1. g:backseat_openai_api_key 2. $OPENAI_API_KEY 3. Prompt user
  local api_key = vim.g.backseat_openai_api_key
  if api_key == nil then
    local key = os.getenv("OPENAI_API_KEY")
    if key ~= nil then
      return key
    end
    local message =
      "No API key found. Please set openai_api_key in the setup table or set the $OPENAI_API_KEY environment variable."
    vim.fn.confirm(message, "&OK", 1, "Warning")
    return nil
  end
  return api_key
end

local function get_model_id()
  local model = vim.g.backseat_openai_model_id
  if model == nil then
    if vim.g.backseat_model_id_complained == nil then
      local message =
        "No model id specified. Please set openai_model_id in the setup table. Defaulting to gpt-3.5-turbo for now" -- "gpt-4"
      vim.fn.confirm(message, "&OK", 1, "Warning")
      vim.g.backseat_model_id_complained = 1
    end
    return "gpt-3.5-turbo"
  end
  return model
end

local function gpt_request(dataJSON, callback, callbackTable)
  local api_key = get_api_key()
  if api_key == nil then
    return nil
  end

  -- Check if curl is installed
  if vim.fn.executable("curl") == 0 then
    vim.fn.confirm("curl installation not found. Please install curl to use Backseat", "&OK", 1, "Warning")
    return nil
  end

  -- Convert dataJSON to a hex string using string.byte so that it can be passed without escaping issues
  local dataHex = ""
  for i = 1, #dataJSON do
    local hex = string.format("%02x", string.byte(dataJSON, i))
    dataHex = dataHex .. "\\x" .. hex
  end

  local curlRequest = string.format(
    "echo -en '"
      .. dataHex
      .. '\' | curl -s https://api.openai.com/v1/chat/completions -H "Content-Type: application/json" -H "Authorization: Bearer '
      .. api_key
      .. '" --data-binary @-'
  )
  -- print(curlRequest)

  -- local response = vim.fn.system(curlRequest)
  vim.fn.jobstart(curlRequest, {
    stdout_buffered = true,
    on_stdout = function(_, data, _)
      local response = table.concat(data, "\n")
      local success, responseTable = pcall(vim.json.decode, response)

      if success == false or responseTable == nil then
        if response == nil then
          response = "nil"
        end
        print("Bad or no response: " .. response)
        return nil
      end

      if responseTable.error ~= nil then
        print("OpenAI Error: " .. responseTable.error.message)
        return nil
      end

      -- print(response)
      callback(responseTable, callbackTable)
      -- return response
    end,
    on_stderr = function(_, data, _)
      return data
    end,
    on_exit = function(_, data, _)
      return data
    end,
  })

  -- vim.cmd("sleep 10000m") -- Sleep to give time to read the error messages
end

local buf = vim.api.nvim_create_buf(false, true)

local function backseat_ask_callback(responseTable)
  if responseTable == nil then
    return nil
  end
  local message = "AI Says: " .. responseTable.choices[1].message.content
  -- vim.fn.confirm(message, "&OK", 1, "Generic")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.fn.split(message, "\n"))
  vim.cmd("vsplit")
  vim.api.nvim_win_set_buf(0, buf)
end

local M = {}

function M.request()
  vim.ui.input({ prompt = "Ask ChatGPT: " }, function(text)
    gpt_request(
      vim.json.encode({
        model = get_model_id(),
        messages = {
          {
            role = "user",
            content = text,
          },
        },
      }),
      backseat_ask_callback
    )
  end)
end

return M
