RSpec.describe MiniAdmin do
  it "has a version number" do
    expect(MiniAdmin::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(MiniAdmin.greet).to eq("Hello")
  end
end
