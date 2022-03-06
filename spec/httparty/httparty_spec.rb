describe "HTTParty" do
  it "content-type" do
    # stub_request(:get, "https://jsonplaceholder.typicode.com/users/1")
    # .to_return(status: 200, body: "", headers: { 'content-type': 'application/json' })

    VCR.use_cassette("jsonplaceholder/posts/2") do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
      content_type = response.headers['content-type']
      code = response.code
      expect(content_type).to match(/application\/json/)
      expect(code).to eql(200)
    end

  end
end
