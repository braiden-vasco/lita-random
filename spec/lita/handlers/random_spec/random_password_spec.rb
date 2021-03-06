describe Lita::Handlers::Random, lita_handler: true do
  it { is_expected.to route_command('RaNdOm pAsSwOrD').to :route_random_pass }
  it { is_expected.to route_command('rAnD PaSsWoRd').to :route_random_pass }
  it { is_expected.to route_command('RanDOm PasS').to :route_random_pass }
  it { is_expected.to route_command('RaNd pAsS').to :route_random_pass }

  it { is_expected.to route_command('RanDOmpASswORd').to :route_random_pass }
  it { is_expected.to route_command('rAndpAsSWord').to :route_random_pass }
  it { is_expected.to route_command('RanDomPass').to :route_random_pass }
  it { is_expected.to route_command('rANdpASs').to :route_random_pass }

  it do
    is_expected.to route_command('RaNdOm pAsSwOrD  0').to :route_random_pass
  end

  it { is_expected.to route_command('rAnD PaSsWoRd 1').to :route_random_pass }
  it { is_expected.to route_command('RanDOm PasS 123').to :route_random_pass }
  it { is_expected.to route_command('RaNd pAsS  4567').to :route_random_pass }

  it do
    is_expected.to route_command('RanDOmpASswORd  890').to :route_random_pass
  end

  it { is_expected.to route_command('rAndpAsSWord 09').to :route_random_pass }
  it { is_expected.to route_command('RanDomPass  876').to :route_random_pass }
  it { is_expected.to route_command('rANdpASs   5432').to :route_random_pass }

  it { is_expected.to route_command('rANdpASs -l 5').to :route_random_pass }

  it do
    is_expected.to route_command('rANdpASs --length 5').to :route_random_pass
  end

  describe '/random password' do
    it 'replies in correct format' do
      send_command('random password')
      expect(replies.last).to match(/\A[\w\d]{16}\z/)
    end
  end

  describe '/random password <length>' do
    it 'replies in correct format' do
      send_command('RaNdOm pAsSwOrD 0')
      expect(replies.last).to eq ''
    end

    it 'replies in correct format' do
      send_command('rANdOMpaSs 1')
      expect(replies.last).to match(/\A[\w\d]{1}\z/)
    end

    it 'replies in correct format' do
      send_command('RanD paSSwoRD 2')
      expect(replies.last).to match(/\A[\w\d]{2}\z/)
    end

    it 'replies in correct format' do
      send_command('rAnDpAsS 32')
      expect(replies.last).to match(/\A[\w\d]{32}\z/)
    end

    it 'replies in correct format' do
      send_command('rAnDpAsS -l 32')
      expect(replies.last).to match(/\A[\w\d]{32}\z/)
    end

    it 'replies in correct format' do
      send_command('rAnDpAsS --length 32')
      expect(replies.last).to match(/\A[\w\d]{32}\z/)
    end

    it 'doesn\'t reply if both positional and keyword arguments present' do
      send_command 'randpass 10 -l 10'
      expect(replies).to be_empty
    end
  end
end
