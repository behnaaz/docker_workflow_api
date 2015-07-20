require 'spec_helper'

describe "Example service" do
  it 'show the name of the player' do
    player = create :player
    get '/v1/players'
    expect(json.count).to eq 1
    expect(json[0]["name"]).to eq(player.name)
  end
end