require 'spec_helper'

describe 'monit_version', :type => :fact do

  before { Facter.clear }
  after  { Facter.clear }

  context 'monit_version when monit v5.14 is installed' do
    it {
      Facter::Util::Resolution.expects(:exec).with('monit -V 2>&1').returns(
        "This is Monit version 5.14\nCopyright (C) 2001-2015 Tildeslash Ltd. All Rights Reserved."
      )
      expect(Facter.fact(:monit_version).value).to eq('5.14')
    }
  end

  context 'monit_version when monit is not installed' do
    it do
      expect(Facter.to_hash.has_key?(:monit_version)).to eq(false)
    end
  end

end
