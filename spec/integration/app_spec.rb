# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  # generates a method called 'app' which returns a new instance of 'Application'


  context "GET /" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end

  context "POST /submit" do
    it "returns 200 OK with the right content" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", name: "Yichao", age: 24)

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Yichao: 24")
    end
  end

  context "GET /names" do
    it 'returns 200 OK with a string of names' do

      response = get('/names?name=Julia, Mary, Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end
  end
  # co-authored-by: Marina

  context "POST /sort_names" do
    it "receive: a list of names; return: same list sorted alphabetically" do
      response = post('/sort_names', names: 'Joe,Alice,Zoe,Julia,Kieran')
      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end
end
