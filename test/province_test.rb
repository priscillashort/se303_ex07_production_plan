gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test
  describe 'province tests' do
    before do
      @asia = Province.new(sample_province_data)
    end

    def test_province_shortfall
      assert_equal(5, @asia.shortfall)
    end

    def test_province_profit
      assert_equal(230, @asia.profit)
    end

    def test_province_production_change
      @asia.producers[0].production = 20
      assert_equal(-6, @asia.shortfall)
      assert_equal(292, @asia.profit)
    end

    def test_province_zero_demand
      @asia.demand = 0
      assert_equal(-25, @asia.shortfall)
      assert_equal(0, @asia.profit)
    end

    def test_province_negative_demand
      @asia.demand = -1
      assert_equal(-26, @asia.shortfall)
      assert_equal(-10, @asia.profit)
    end

    #def test_province_empty_string_demand
      #@asia.demand = ""
      #assert(!(@asia.shortfall.is_a? Numeric))
      #assert(!(@asia.profit.is_a? Numeric))
    #end
  end

  describe 'no producers' do
    before do
      data = {
        name: "No proudcers",
        producers: [],
        demand: 30,
        price: 20
      }
      @noProducers = Province.new(data)
    end

    def test_no_producers_shortfall
      assert_equal(30, @noProducers.shortfall)
    end

    def test_no_producers_profit
      assert_equal(0, @noProducers.profit)
    end
  end

  #describe 'string for producers' do
    #def test_string_producers_shortfall
      #data = {
      #  name: "String proudcers",
      #  producers: "",
      #  demand: 30,
      #  price: 20
      #}
      #prov = Province.new(data)
      #assert_equal(0, prov.shortfall)
    #end
  #end
end
