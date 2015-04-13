# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'minitest/autorun'
#include FixtureDataHelper
require './lib/attask'

describe Attask do
  let (:attask_object) {Attask.client('cl01', 'un', 'pwd')}

  describe 'get teams from attask api' do
    it 'should be a Attask Base object' do
      expect(attask_object).to be_kind_of(Attask::Base)
    end

    it 'should return matching team details based on team name' do
      Attask::Credentials.any_instance.stub("is_loged?").and_return(true)
      Attask::API::Base.any_instance.stub("request").and_return(fixture("metadata.json"))
      Attask::API::Task.any_instance.stub("getAllFields").and_return(fixture("metadata.json"))
      Attask::API::Task.any_instance.stub("getCustomFields").and_return(fixture("metadata.json"))
      Attask::API::Task.any_instance.stub("parsed_response").and_return(fixture("metadata.json"))
      Attask::API::Task.any_instance.stub("search").and_return(fixture("teams.json"))

      Attask.get_team_ids(attask_object, "engg team").should eq(fixture('teams.json'))
    end
  end
end

=begin
describe 'get tasks based on teams' do
  Object.any_instance.stub("get_all_tasks").and_return(fixture('tasks.json'))
  it 'expects team id to fetch tasks' do

  end


  it 'should return ' do
  end

=end

