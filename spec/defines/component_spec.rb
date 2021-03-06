require 'spec_helper'
describe 'homeassistant::component' do
  let(:title) { 'mine' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      let(:pre_condition) do
        'class{"homeassistant":
           location_name => "My Home",
           latitude      => 23.4,
           longitude     => -14.7,
           elevation     => 23,
           unit_system   => "metric",
           time_zone     => "Europe/Paris",
         }
        '
      end

      it { is_expected.to contain_concat__fragment('mine').with_target('configuration.yaml') }
      context 'with no parameters' do
        it { is_expected.to contain_concat__fragment('mine').with_content(%r{^mine:$}) }
        it { is_expected.not_to contain_file('/etc/homeassistant/components/mine.yaml') }
      end
      context 'with config parameters set' do
        let(:params) do
          {
            config: { 'abc' => %w[def ijk] }
          }
        end

        it { is_expected.to contain_concat__fragment('mine').with_content(%r{^mine: !include components/mine/mine.yaml$}) }
        it { is_expected.to contain_file('/etc/homeassistant/components/mine/mine.yaml') }
        it { is_expected.to contain_file('/etc/homeassistant/components/mine/mine.yaml').with_content(%r{^abc:$}) }
        it { is_expected.to contain_file('/etc/homeassistant/components/mine/mine.yaml').with_content(%r{^\s*- def$}) }
      end
      context 'with config and component parameters set' do
        let(:params) do
          {
            component: 'special',
            config: { 'abc' => %w[def ijk] }
          }
        end

        it { is_expected.to contain_concat__fragment('mine').with_content(%r{^special mine: !include components/special/mine.yaml$}) }
        it { is_expected.to contain_file('/etc/homeassistant/components/special/mine.yaml') }
        it { is_expected.to contain_file('/etc/homeassistant/components/special/mine.yaml').with_content(%r{^abc:$}) }
        it { is_expected.to contain_file('/etc/homeassistant/components/special/mine.yaml').with_content(%r{^\s*- def$}) }
      end
    end
  end
end
