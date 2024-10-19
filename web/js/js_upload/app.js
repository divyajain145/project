const textarea = document.querySelector('#editor');

var editor = CodeMirror.fromTextArea(textarea,{
    mode:"htmlmixed",
    theme:"base16-dark",
    lineNumbers:true,
});

