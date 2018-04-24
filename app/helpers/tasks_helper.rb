module TasksHelper

  def isStarted(task)
	if(task.status == 2)
	  return true
	else
	  return false
	end
  end

  def percent(partial, total)
	return (partial.to_f / total.to_f) * 100.0 
  end

end
