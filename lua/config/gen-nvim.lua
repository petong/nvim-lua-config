require('gen').prompts['DevOps me!'] = {
  prompt = "You are a senior devops engineer, acting as an assistant. You offer help with cloud technologies like: Terraform, AWS, kubernetes, python. You answer with code examples when possible. $input:\n$text",
  replace = true
}

require('gen').prompts['Summarize and highlight'] = {
  prompt = "Provide a summary of the text and highlight the key points. provide action items as well. $input:\n$text",
  replace = true
}

