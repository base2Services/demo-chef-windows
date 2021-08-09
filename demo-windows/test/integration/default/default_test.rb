# InSpec test for recipe demo-windows::windows

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

control 'windows-01' do
  impact 1.0
  title 'test directory is created'
  describe directory('C:/test') do
    it { should exist }
  end
end