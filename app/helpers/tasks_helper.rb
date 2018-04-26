module TasksHelper

  def isStarted(task)
	if(task.status == 2)
	  return true
	else
	  return false
	end
  end

  def countTasks(n)
  	if n > 1
  		return "#{n} tarefas abertas"
  	elsif n == 1
  		return "#{n} tarefa aberta"
  	else
  		return "nenhuma tarefa aberta"
  	end
  end

  def percent(partial, total)
	return (partial.to_f / total.to_f) * 100.0 
  end

  def format_date(date)
  	return date.strftime("%d/%m")
  end

  def icon_end(task)
  	if task.finished?
  	  "event_available"	
  	else
  	  "date_range"
  	end	
  end

  def to_hours(mins)
  	return mins / 60
  end

  def to_mins(hours)
  	return hours * 60
  end

end
