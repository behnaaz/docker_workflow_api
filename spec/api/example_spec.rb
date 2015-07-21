describe "Example service" do
  it 'show all quotes' do
    quote = create :quote
    get '/v1/quotes'
    expect(json.count).to eq 1
    expect(json[0]["text"]).to eq(quote.text)
  end
end