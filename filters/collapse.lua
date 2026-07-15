-- collapse.lua
-- Renders a fenced div like:
--
--   ::: {.collapse-item #some-unique-id title="10/15/2025 -- Some title" parent="#events-list"}
--   Markdown body...
--   :::
--
-- into the TheEvent-template Bootstrap collapse <li> markup used by the
-- Events, News, and F.A.Q. lists. The #id must be unique page-wide.

function Div(el)
  if not el.classes:includes('collapse-item') then
    return nil
  end

  local id = el.identifier
  if id == nil or id == '' then
    error('collapse-item is missing a unique #id attribute')
  end
  local title = el.attributes['title'] or 'Untitled'
  local parent = el.attributes['parent'] or '#events-list'

  local pre = pandoc.RawBlock('html', string.format(
    '<li>\n' ..
    '  <a data-toggle="collapse" class="collapsed" href="#%s">%s <i class="fa fa-minus-circle"></i></a>\n' ..
    '  <div id="%s" class="collapse" data-parent="%s">',
    id, title, id, parent))
  local post = pandoc.RawBlock('html', '  </div>\n</li>')

  local out = pandoc.Blocks({ pre })
  out:extend(el.content)
  out:insert(post)
  return out
end
