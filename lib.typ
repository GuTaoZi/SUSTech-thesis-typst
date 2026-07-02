#import "@preview/gb7714-bilingual:0.2.3": init-gb7714
#import "layouts/document.typ": abstract as render_abstract
#import "layouts/document.typ": acknowledgement as render_acknowledgement
#import "layouts/document.typ": appendix as render_appendix
#import "layouts/document.typ": content as render_content
#import "layouts/document.typ": cover as render_cover
#import "layouts/document.typ": declare as render_declare
#import "layouts/document.typ": document_style
#import "layouts/document.typ": figures as render_figures
#import "layouts/document.typ": references as render_references
#import "layouts/document.typ": tables as render_tables
#import "profiles/undergraduate.typ": undergraduate_profile as undergraduate_profile_impl
#import "utils/helpers.typ": force_indent as force_indent_impl
#import "utils/helpers.typ": data_source as data_source_impl
#import "utils/helpers.typ": dataSource as data_source_legacy_impl

#let setup(
  profile: undergraduate_profile_impl,
  lang: "zh",
  anonymous: false,
  fonts: (:),
  info: (:),
  info_en: (:),
  keywords_zh: (),
  keywords_en: (),
  abstract_body_zh: [],
  abstract_body_en: [],
  bibliography_data: none,
  bibliography_style: auto,
  bibliography_standard: auto,
  bibliography_full: auto,
  bibliography_show_url: auto,
  bibliography_show_doi: auto,
  bibliography_show_accessed: auto,
  declaration_print_date: none,
  include_zh_cover: auto,
  include_en_cover: auto,
  include_zh_declaration: auto,
  include_en_declaration: auto,
  include_list_of_figures: auto,
  include_list_of_tables: auto,
  prefer_en_header: auto,
  abstract_en_first: auto,
  list_of_figures_show_both: auto,
  list_of_tables_show_both: auto,
  references_show_both: auto,
  appendix_show_both: auto,
  acknowledgement_show_both: auto,
) = {
  let merge_info(defaults, overrides) = defaults + overrides
  let options = profile.options
  let info_zh = merge_info(profile.info_zh, info)
  let info_en = merge_info(profile.info_en, info_en)
  let bibliography_style = if bibliography_style == auto {
    options.bibliography_style
  } else {
    bibliography_style
  }
  let bibliography_standard = if bibliography_standard == auto {
    options.bibliography_standard
  } else {
    bibliography_standard
  }
  let bibliography_full = if bibliography_full == auto {
    options.bibliography_full
  } else {
    bibliography_full
  }
  let bibliography_show_url = if bibliography_show_url == auto {
    options.bibliography_show_url
  } else {
    bibliography_show_url
  }
  let bibliography_show_doi = if bibliography_show_doi == auto {
    options.bibliography_show_doi
  } else {
    bibliography_show_doi
  }
  let bibliography_show_accessed = if bibliography_show_accessed == auto {
    options.bibliography_show_accessed
  } else {
    bibliography_show_accessed
  }
  let include_zh_cover = if include_zh_cover == auto {
    options.include_zh_cover
  } else {
    include_zh_cover
  }
  let include_en_cover = if include_en_cover == auto {
    options.include_en_cover
  } else {
    include_en_cover
  }
  let include_zh_declaration = if include_zh_declaration == auto {
    options.include_zh_declaration
  } else {
    include_zh_declaration
  }
  let include_en_declaration = if include_en_declaration == auto {
    options.include_en_declaration
  } else {
    include_en_declaration
  }
  let include_list_of_figures = if include_list_of_figures == auto {
    options.include_list_of_figures
  } else {
    include_list_of_figures
  }
  let include_list_of_tables = if include_list_of_tables == auto {
    options.include_list_of_tables
  } else {
    include_list_of_tables
  }
  let prefer_en_header = if prefer_en_header == auto {
    options.prefer_en_header
  } else {
    prefer_en_header
  }
  let abstract_en_first = if abstract_en_first == auto {
    options.abstract_en_first
  } else {
    abstract_en_first
  }
  let list_of_figures_show_both = if list_of_figures_show_both == auto {
    options.list_of_figures_show_both
  } else {
    list_of_figures_show_both
  }
  let list_of_tables_show_both = if list_of_tables_show_both == auto {
    options.list_of_tables_show_both
  } else {
    list_of_tables_show_both
  }
  let references_show_both = if references_show_both == auto {
    options.references_show_both
  } else {
    references_show_both
  }
  let appendix_show_both = if appendix_show_both == auto {
    options.appendix_show_both
  } else {
    appendix_show_both
  }
  let acknowledgement_show_both = if acknowledgement_show_both == auto {
    options.acknowledgement_show_both
  } else {
    acknowledgement_show_both
  }

  let cover_zh = () => render_cover(
    en: false,
    anonymous: anonymous,
    info: info_zh,
    fonts: fonts,
  )
  let cover_en = () => render_cover(
    en: true,
    anonymous: anonymous,
    info: info_en,
    fonts: fonts,
  )
  let declaration_zh = () => render_declare(
    en: false,
    anonymous: anonymous,
    print_date: declaration_print_date,
  )
  let declaration_en = () => render_declare(
    en: true,
    anonymous: anonymous,
    print_date: declaration_print_date,
  )
  let covers = () => {
    if include_zh_cover {
      cover_zh()
    }
    if include_en_cover {
      cover_en()
    }
  }
  let declarations = () => {
    if include_zh_declaration {
      declaration_zh()
    }
    if include_en_declaration {
      declaration_en()
    }
  }
  let abstracts = () => render_abstract(
    show_title: true,
    prefer_en_header: prefer_en_header,
    en: abstract_en_first,
    anonymous: anonymous,
    info_zh: info_zh,
    info_en: info_en,
    keywords_zh: keywords_zh,
    keywords_en: keywords_en,
    body_zh: abstract_body_zh,
    body_en: abstract_body_en,
    fonts: fonts,
  )
  let outline = () => render_content()
  let list_of_figures = (
    show_both: list_of_figures_show_both,
  ) => render_figures(show_both: show_both)
  let list_of_tables = (
    show_both: list_of_tables_show_both,
  ) => render_tables(show_both: show_both)
  let preface = () => {
    covers()
    declarations()
    set page(numbering: profile.page_numbering.preface)
    counter(page).update(1)
    abstracts()
    outline()
    if include_list_of_figures {
      render_figures.with(show_both: list_of_figures_show_both)()
    }
    if include_list_of_tables {
      render_tables.with(show_both: list_of_tables_show_both)()
    }
  }
  let mainmatter = body => {
    set page(numbering: profile.page_numbering.mainmatter)
    counter(page).update(1)
    body
  }
  let references = (
    show_both: references_show_both,
    full: bibliography_full,
  ) => render_references(
    show_both: show_both,
    full: full,
  )
  let appendix = body => {
    render_appendix(show_both: appendix_show_both)
    body
  }
  let acknowledgement = body => render_acknowledgement(
    show_both: acknowledgement_show_both,
  )[#body]
  let style = body => {
    let body = if bibliography_data != none {
      init-gb7714(
        bibliography_data,
        style: bibliography_style,
        version: bibliography_standard,
        show-url: bibliography_show_url,
        show-doi: bibliography_show_doi,
        show-accessed: bibliography_show_accessed,
        body,
      )
    } else {
      body
    }

    document_style(lang: lang, body)
  }

  (
    profile: profile,
    style: style,
    info: info_zh,
    info_en: info_en,
    cover: covers,
    cover_zh: cover_zh,
    cover_en: cover_en,
    covers: covers,
    declaration: declarations,
    declaration_zh: declaration_zh,
    declaration_en: declaration_en,
    declarations: declarations,
    abstract: abstracts,
    abstracts: abstracts,
    content: outline,
    outline: outline,
    list_of_figures: list_of_figures,
    list_of_tables: list_of_tables,
    preface: preface,
    mainmatter: mainmatter,
    references: references,
    appendix: appendix,
    acknowledgement: acknowledgement,
  )
}

#let documentclass(..args) = setup(..args)
#let force_indent = force_indent_impl
#let data_source = data_source_impl
#let dataSource = data_source_legacy_impl
#let undergraduate_profile = undergraduate_profile_impl
