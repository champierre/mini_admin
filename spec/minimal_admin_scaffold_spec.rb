RSpec.describe MinimalAdminScaffold do
  it "has a version number" do
    expect(MinimalAdminScaffold::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(MinimalAdminScaffold.greet).to eq("Hello")
  end
end
