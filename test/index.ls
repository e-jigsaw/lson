require! {
  tape: test
  path: {resolve}
  \../index.ls : lson
}

expect = '{"an_array":["an","array","of","strings"],"another_array":["another","array"],"a_dict":{"key":"value"},"a_string":"some string","another_string":"anotherstring"}'

test 'Parse lson', (t)->
  t.plan 1

  t.equal do
    JSON.stringify lson.parse '''
      an_array: <[ an array of strings ]>
      another_array: [
        'another'
        'array'
      ]
      # we can even have comments
      a_dict: {
        key: 'value'
      }
      a_string: 'some string'
      another_string: \\anotherstring
    '''
    expect

test 'Parse lson file', (t)->
  t.plan 1

  t.equal do
    lson.parse-file resolve __dirname, \./fixture/sample.lson |> JSON.stringify
    expect
