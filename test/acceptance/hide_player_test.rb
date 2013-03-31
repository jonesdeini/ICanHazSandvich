require "test_helper"

# To be handled correctly this spec must end with "Acceptance Test"
describe "HidePlayer Acceptance Test" do

  before do
    @steam_id = "76561198015466913"
    @crate_19 = create :crate_19
    file = File.open("./test/sample_bp.json")
    @json = JSON.parse(file.read)
    BaseItem.count.must_equal 1
    Player.count.must_equal 0
    BackpackSearcher.new @json, @steam_id
    Player.count.must_equal 1
    Player.first.items.count.must_equal 1
  end

  it "must not show a hidden player" do
    skip "fix for authentication"
    visit item_path @crate_19
    # visit "/items/#{@crate_19.id}"
    page.must_have_content 'hide'
    click_link 'hide'
    # this will fail, so asserting content exists is redundant
    # click_link 'broooooooooooooooooooooooooooooo'
    visit item_path @crate_19
    page.wont_have_content 'hide'
  end
end
