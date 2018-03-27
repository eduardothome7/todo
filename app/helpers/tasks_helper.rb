module TasksHelper

	def isStarted(task)
		if(task.status == 2)
			return true
		else
			return false
		end
	end


end
