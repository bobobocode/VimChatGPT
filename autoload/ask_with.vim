function! ask_with#all(question)
    let current_content = join(getline(1, '$'), ";")
    let question = a:question . " : " . current_content
    let question = escape(question, '\"')
    return question
endfunction


function! ask_with#selected(question)
    let codes = Join_selected_lines()

    let question = a:question . " : " . codes
    let question = escape(question, '\"')
    return question
endfunction


function! Join_selected_lines()
    let [start_row, start_col] = getpos("'<")[1:2]
    let [end_row, end_col] = getpos("'>")[1:2]
    let range = [start_row, end_row]

    let lines = getline(range[0], range[1])
    let text = join(lines, '\n')
    return text
endfunction


function! ask_with#lines(question)
    let parts = split(a:question, '::')
    let title = parts[0]
    let start_line = parts[1]
    let end_line = parts[2]


    let content = ""
    for line_num in range(start_line, end_line)
      let line_content = getline(line_num)
      let content = content . '\n' . line_content
    endfor

    let ask_question = title . '\n' . content
    return ask_question
endfunction