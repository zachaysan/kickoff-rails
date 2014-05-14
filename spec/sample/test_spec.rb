describe String do

  it "Should properly run rspec with this very basic test" do
    # If this doesn't work, rspec 3 is the issue.
    expect("1".to_i).to eq(1)
  end

end
