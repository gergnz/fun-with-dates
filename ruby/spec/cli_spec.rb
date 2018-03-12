# frozen_string_literal: true

require 'spec_helper'

describe 'fun_with_dates_extremes', type: :aruba do
  context '01/01/2000 03/01/2000' do
    it 'prints out 1' do
      run './fun_with_dates.rb 01/01/2000 03/01/2000'
      expect(last_command_started).to have_output_on_stdout('1')
    end
  end
  context '01/01/1901 31/12/2999' do
    it 'prints out 401400' do
      run './fun_with_dates.rb 01/01/1901 31/12/2999'
      expect(last_command_started).to have_output_on_stdout('401400')
    end
  end
end

describe 'fun_with_dates_tests', type: :aruba do
  context '02/06/1983 22/06/1983' do
    it 'prints out 19' do
      run './fun_with_dates.rb 02/06/1983 22/06/1983'
      expect(last_command_started).to have_output_on_stdout('19')
    end
  end
  context '' do
    it 'prints out 04/07/1984 25/12/1984' do
      run './fun_with_dates.rb 04/07/1984 25/12/1984'
      expect(last_command_started).to have_output_on_stdout('173')
    end
  end
  context '03/01/1989 03/08/1983' do
    it 'prints out 1979' do
      run './fun_with_dates.rb 03/01/1989 03/08/1983'
      expect(last_command_started).to have_output_on_stdout('1979')
    end
  end
end
