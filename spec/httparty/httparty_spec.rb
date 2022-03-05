describe "HTTParty" do
  it "HTTParty" do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/users/1')
    content_type = response.headers['content-type']
    code = response.code

    expect(content_type).to match(/application\/json/)
    expect(code).to eql(200)
  end
end
