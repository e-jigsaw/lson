require! {
  livescript: {compile}
  \cson-safe : {parse}
}

strip-trailing-semicolon = (str)->
  if str[*-1] == \; then str.slice 0, str.length - 1 else str

strip-parentheses = (str)->
  if str[0] == \( and str[*-1] == \) then str.slice 1, str.length - 1 else str

parse-lson = (str)->
  parse strip-parentheses strip-trailing-semicolon compile do
    str
    header: false
    bare: true

module.exports.parse = (str)-> parse-lson str

module.exports.parse-file = (filename)->
  parse-lson do
    require \fs .readFileSync filename .toString!
