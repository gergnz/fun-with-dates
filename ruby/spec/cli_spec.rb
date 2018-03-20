# frozen_string_literal: true

require 'spec_helper'

describe 'fun_with_dates_extremes', type: :aruba do
  context '01/01/2000 01/01/2000' do
    it 'prints out 0' do
      run './fun_with_dates.rb 01/01/2000 01/01/2000'
      expect(last_command_started).to have_output_on_stdout('0')
    end
  end
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

describe 'fun_with_dates_leap_years', type: :aruba do
  context '27/02/2000 01/03/2000' do
    it 'prints out 2' do
      run './fun_with_dates.rb 27/02/2000 01/03/2000'
      expect(last_command_started).to have_output_on_stdout('2')
    end
  end
  context '01/03/1980 1/03/1984' do
    it 'prints out 1460' do
      run './fun_with_dates.rb 01/03/1980 01/03/1984'
      expect(last_command_started).to have_output_on_stdout('1460')
    end
  end
  context '01/02/1980 1/03/1984' do
    it 'prints out 1489' do
      run './fun_with_dates.rb 01/02/1980 01/03/1984'
      expect(last_command_started).to have_output_on_stdout('1489')
    end
  end
  context '01/02/1980 1/02/1984' do
    it 'prints out 1460' do
      run './fun_with_dates.rb 01/02/1980 01/02/1984'
      expect(last_command_started).to have_output_on_stdout('1460')
    end
  end
end

describe 'fun_with_dates_complex_leap_years', type: :aruba do
  context '01/01/2000 01/03/2000' do
    it 'prints out 59' do
      run './fun_with_dates.rb 01/01/2000 01/03/2000'
      expect(last_command_started).to have_output_on_stdout('59')
    end
  end
  context '01/01/1980 1/01/1985' do
    it 'prints out 1826' do
      run './fun_with_dates.rb 01/01/1980 01/01/1985'
      expect(last_command_started).to have_output_on_stdout('1826')
    end
  end
  context '01/01/2099 01/01/2101' do
    it 'prints out 729' do
      run './fun_with_dates.rb 01/01/2099 01/01/2101'
      expect(last_command_started).to have_output_on_stdout('729')
    end
  end
end
