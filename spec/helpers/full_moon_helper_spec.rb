require 'rails_helper'

RSpec.describe FullMoonHelper do
  it "returns the next full moon" do
    Timecop.freeze(Time.parse('20171220 15:05:00')) do
      expect(FullMoonHelper.next_full_moon).to eql(1514864066)
    end
  end
end
