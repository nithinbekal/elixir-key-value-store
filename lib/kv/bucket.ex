defmodule KV.Bucket do
  def start_link do
    Agent.start_link(fn -> HashDict.new end)
  end

  def get(agent, key) do
    Agent.get(agent, &HashDict.get(&1, key))
  end

  def put(agent, key, value) do
    Agent.update(agent, &HashDict.put(&1, key, value))
  end

  def delete(agent, key) do
    Agent.get_and_update(agent, &HashDict.pop(&1, key))
  end
end
