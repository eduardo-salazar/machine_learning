require 'minitest/autorun'
require 'csv'
require_relative '../init.rb'


describe 'Bayesian Network' do
  it 'should create network and return probability' do
    net       = BayesianNetwork::Net.new("Grass Wetness Belief Net")
    cloudy    = BayesianNetwork::Variable.new(net, :cloudy, [0.5, 0.5])
    sprinkler = BayesianNetwork::Variable.new(net, :sprinkler, [0.1, 0.9, 0.5, 0.5])
    rain      = BayesianNetwork::Variable.new(net, :rain, [0.8, 0.2, 0.2, 0.8])
    grass_wet = BayesianNetwork::Variable.new(net, :grass_wet, [0.99, 0.01, 0.9, 0.1, 0.9, 0.1, 0.0, 1.0])
    cloudy.add_child(sprinkler)        # also creates parent relationship
    cloudy.add_child(rain)
    sprinkler.add_child(grass_wet)
    rain.add_child(grass_wet)
    evidence = {:cloudy => :false, :rain => :true}
    net.set_evidence(evidence)
    puts net.query_variable(:grass_wet)
    evidence = {:cloudy => :true, :grass_wet => :true}
    net.set_evidence(evidence)
    puts net.query_variable(:rain)
  end

  it 'should create network and return probability' do
    net       = BayesianNetwork::Net.new("")
    cloudy    = BayesianNetwork::Variable.new(net, :cloudy, [0.5, 0.5])
    sprinkler = BayesianNetwork::Variable.new(net, :sprinkler, [0.1, 0.9, 0.5, 0.5])
    rain      = BayesianNetwork::Variable.new(net, :rain, [0.8, 0.2, 0.2, 0.8])
    grass_wet = BayesianNetwork::Variable.new(net, :grass_wet, [0.99, 0.01, 0.9, 0.1, 0.9, 0.1, 0.0, 1.0])
    cloudy.add_child(sprinkler)        # also creates parent relationship
    cloudy.add_child(rain)
    sprinkler.add_child(grass_wet)
    rain.add_child(grass_wet)
    evidence = {:cloudy => :false, :rain => :true}
    net.set_evidence(evidence)
    net.query_variable(:grass_wet)
  end


end
