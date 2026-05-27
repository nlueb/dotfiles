local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("ui8", t("std::uint8_t")),
	s("ui16", t("std::uint16_t")),
	s("ui32", t("std::uint32_t")),
	s("ui64", t("std::uint64_t")),
	s("ii8", t("std::int8_t")),
	s("ii16", t("std::int16_t")),
	s("ii32", t("std::int32_t")),
	s("ii64", t("std::int64_t")),
	s("size", t("std::size_t")),
	s("opt", { t("std::optional<"), i(1), t(">"), i(2) }),
	s("scas", { t("static_cast<"), i(1), t(">"), i(2) }),
}
