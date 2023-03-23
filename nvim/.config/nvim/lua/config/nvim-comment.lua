local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  dump("Comment plugin not found")
  return
end

comment.setup()
