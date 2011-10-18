require 'spec_helper'

describe 'home page' do
  it 'should welcome exists' do
    visit '/'
    page.should have_content('Casamasomenos')
  end
end
