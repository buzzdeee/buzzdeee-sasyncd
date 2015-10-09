require 'spec_helper'
describe 'sasyncd' do

  context 'with defaults for all parameters' do
    it { should contain_class('sasyncd') }
  end
end
