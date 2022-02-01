local status_ok, autosave = pcall(require, "autosave")
if not status_ok then
	return
end

autosave.setup()

