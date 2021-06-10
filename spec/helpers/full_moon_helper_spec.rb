require 'rails_helper'

RSpec.describe FullMoonHelper do
  it "returns the next full moon" do
    Timecop.freeze(Time.parse('20171220 15:05:00')) do
      expect(FullMoonHelper.next_full_moon).to eql(1514864066)
    end
  end

  it "NextFullMoon 2018-01-31" do
    Timecop.freeze(Time.parse('20180104 08:54:00')) do
      expect(FullMoonHelper.next_full_moon).to eql(1517422824)
    end
  end

  it "NextFullMoon 2021-06-11" do
    Timecop.freeze(Time.parse('20210611 08:54:00')) do
      expect(FullMoonHelper.next_full_moon).to eql(1624579094)
    end
  end
end
