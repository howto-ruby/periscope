shared_examples_for 'a permission set' do
  it 'has unique values' do
    values = %w(one two two three)

    permission_set = described_class.new(values)
    permission_set.to_a.should == values.uniq
  end

  it 'stingifies values when adding' do
    values = [:one, :two, :three]

    permission_set = described_class.new + values
    permission_set.to_a.should == values.map(&:to_s)
  end

  it 'stringifies a value when checking for inclusion' do
    values = %w(one two three)
    value = values.first.to_sym

    permission_set = described_class.new(values)
    permission_set.should include(value)
  end
end