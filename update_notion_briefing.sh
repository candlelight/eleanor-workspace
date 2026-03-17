#!/bin/bash
# Update Notion Daily Briefing Page - March 17, 2026

NOTION_TOKEN="${NOTION_TOKEN:-}"  # Set via environment variable
PAGE_ID="a5498b602fba82a7a7ab810b69d42258"

curl -s -X PATCH \
  -H "Authorization: Bearer $NOTION_TOKEN" \
  -H "Notion-Version: 2022-06-28" \
  -H "Content-Type: application/json" \
  "https://api.notion.com/v1/blocks/$PAGE_ID/children" \
  -d @- << 'EOF'
{
  "children": [
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Vol. I | Tuesday, March 17, 2026 | 7:00 AM PST"}, "annotations": {"italic": true}}
        ]
      }
    },
    {"object": "block", "type": "divider", "divider": {}},
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [{"type": "text", "text": {"content": "🌤️ Personal Context"}}]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Sacramento: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "Heat wave conditions — High 81°F / Low 61°F. Record-setting March heat wave with highs between 90-103°F through March 19. Wind 11 mph from West Southwest. Stay hydrated and limit outdoor activities during peak heat (11am-4pm)."}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Calendar: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "Check Google Calendar for today's events"}, "annotations": {"italic": true}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Flagged Emails: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "Check Gmail for urgent/starred messages"}, "annotations": {"italic": true}}
        ]
      }
    },
    {"object": "block", "type": "divider", "divider": {}},
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [{"type": "text", "text": {"content": "📈 Financial & Markets"}}],
        "color": "blue_background"
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "S&P 500: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "Flat to slightly positive (+0.17%) — SPY up $1.16\n"}},
          {"type": "text", "text": {"content": "NASDAQ: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "Down 0.02% (about 4 points)\n"}},
          {"type": "text", "text": {"content": "Gold: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "$5,019/oz (Up $23)\n"}},
          {"type": "text", "text": {"content": "Bitcoin: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "$73,892 (Down ~$980)\n"}},
          {"type": "text", "text": {"content": "10Y Treasury: "}, "annotations": {"bold": true}},
          {"type": "text", "text": {"content": "4.20% (Down from Monday's close above 4.22% as Fed policy meeting kicked off)"}}
        ]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "Congress Trading"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [{"type": "text", "text": {"content": "Nancy Pelosi (Dem - House): Actively tracked on Quiver Quantitative"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [{"type": "text", "text": {"content": "Markwayne Mullin (Rep - Senate): Trading activity monitored"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [{"type": "text", "text": {"content": "J.D. Vance (Rep - VP): Portfolio tracked"}}]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Note: STOCK Act requires disclosure within 45 days. Data reflects recent filings from March 10-12, 2026 period."}, "annotations": {"italic": true}}
        ]
      }
    },
    {"object": "block", "type": "divider", "divider": {}},
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [{"type": "text", "text": {"content": "📰 Headlines"}}],
        "color": "blue_background"
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "Financial Times"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Middle East War: Dubai flights delayed or cancelled after latest drone and missile attacks", "link": {"url": "https://www.ft.com/world"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [{"type": "text", "text": {"content": "Regional travel hubs Doha and Abu Dhabi also severely constrained by fallout from conflict."}, "annotations": {"italic": true}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Top US counterterrorism official resigns over war against Iran", "link": {"url": "https://www.ft.com/"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [{"type": "text", "text": {"content": "Joe Kent is first high-profile resignation over conflict he claims 'serves no benefit to the American people'."}, "annotations": {"italic": true}}]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "Reuters"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Live: Iran confirms security chief Larijani killed by Israel as Trump lashes out at NATO allies", "link": {"url": "https://www.reuters.com/"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [{"type": "text", "text": {"content": "The US president's comments come after a growing list of nations, including many European powers, turned down his request to help protect the Strait of Hormuz."}, "annotations": {"italic": true}}]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "NY Times"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Israel Is Picking Off Iran's Leadership, but 'Decapitation Has Its Limits'", "link": {"url": "https://www.nytimes.com/2026/03/17/world/middleeast/israel-iran-leader-deaths.html"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [{"type": "text", "text": {"content": "Ali Larijani's death highlighted how heavily Israel is relying on targeted killings to achieve its war aims. That approach can backfire."}, "annotations": {"italic": true}}]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "BBC"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Iran confirms security chief Larijani killed by Israel", "link": {"url": "https://www.bbc.com/news/articles/cgqgxqekp89o"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [{"type": "text", "text": {"content": "Larijani has long been seen as one of the Islamic Republic's most experienced and influential policy makers."}, "annotations": {"italic": true}}]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "The Guardian"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Lisa Nandy vows to give BBC permanent charter to prevent political interference", "link": {"url": "https://www.theguardian.com/media/2026/mar/17/all"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [{"type": "text", "text": {"content": "Minister says the change is needed to protect the corporation from repeated 'culture war' attacks."}, "annotations": {"italic": true}}]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "The Atlantic"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Everyone but Trump Understands What He's Done", "link": {"url": "https://www.theatlantic.com/ideas/2026/03/trump-iran-war-allies/686423/"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [{"type": "text", "text": {"content": "Allied leaders know that any positive gesture they make will count for nothing."}, "annotations": {"italic": true}}]
      }
    },
    {"object": "block", "type": "divider", "divider": {}},
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [{"type": "text", "text": {"content": "💻 Tech & AI"}}],
        "color": "blue_background"
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "Wired"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Meta Is Shutting Down Horizon Worlds on Meta Quest", "link": {"url": "https://www.wired.com/story/meta-is-shutting-down-horizon-worlds-on-meta-quest/"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "The Tesla Influencers Leaving the 'Cult'", "link": {"url": "https://www.wired.com/story/the-tesla-influencers-leaving-the-cult/"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "The Verge"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Meta is shutting down its VR metaverse on June 15th", "link": {"url": "https://www.theverge.com/"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Tumblr reverts controversial reblog changes after user backlash", "link": {"url": "https://www.theverge.com/tech/895954/tumblr-reblog-chain-update-backlash"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "heading_3",
      "heading_3": {
        "rich_text": [{"type": "text", "text": {"content": "AI Developments"}}]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Anthropic rolled out memory features to all Claude users — Claude can now retain context and preferences across conversations", "link": {"url": "https://www.anthropic.com/news"}}}
        ]
      }
    },
    {
      "object": "block",
      "type": "bulleted_list_item",
      "bulleted_list_item": {
        "rich_text": [
          {"type": "text", "text": {"content": "Nvidia GTC 2026: Jensen Huang's keynote ongoing. Nvidia remains the backbone of AI chip production for OpenAI, Google and Anthropic", "link": {"url": "https://www.cnet.com/news-live/nvidia-gtc-2026-live-blog-updates/"}}}
        ]
      }
    },
    {"object": "block", "type": "divider", "divider": {}},
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [{"type": "text", "text": {"content": "📊 Below the Fold"}}]
      }
    },
    {
      "object": "block",
      "type": "toggle",
      "toggle": {
        "rich_text": [{"type": "text", "text": {"content": "🎨 Design & UX"}}],
        "children": [
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Nielsen Norman Group: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "3 Tips to Make AI a Better Editor", "link": {"url": "https://www.nngroup.com/videos/better-AI-editor/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "Although AI is (usually) good at editing, good prompting practices shouldn't be ignored. These 3 tips will help take AI edits to the next level."}, "annotations": {"italic": true}}]
            }
          },
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Nielsen Norman Group: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "Design Process Isn't Dead, It's Compressed", "link": {"url": "https://www.nngroup.com/articles/design-process-isnt-dead/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "As AI speeds up design work, the argument to 'throw out the process' misrepresents how experienced designers work."}, "annotations": {"italic": true}}]
            }
          },
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Nielsen Norman Group: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "The Methodological Problems Hiding in Your Research Tools", "link": {"url": "https://www.nngroup.com/articles/research-tool-problems/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "The methodological blind spots in UX research tools have always been a problem. Now that AI is planning and analyzing research, it's gotten worse."}, "annotations": {"italic": true}}]
            }
          }
        ]
      }
    },
    {
      "object": "block",
      "type": "toggle",
      "toggle": {
        "rich_text": [{"type": "text", "text": {"content": "🧵 Surface Pattern & Textile Design"}}],
        "children": [
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Pattern Observer: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "Trend Resources for Textile Designers: What's Out There and How to Use Them", "link": {"url": "https://patternobserver.com/2026/03/14/trend-resources-for-textile-designers-whats-out-there-and-how-to-use-them/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "Guide to trend resources for textile designers. First lesson and WGSN registration available March 30, 2026."}, "annotations": {"italic": true}}]
            }
          },
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Pattern Observer: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "Scottish Art Nouveau from Charles & Margaret Mackintosh", "link": {"url": "https://patternobserver.com/2026/03/08/scottish-art-nouveau-from-charles-margaret-mackintosh/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "Exploration of Art Nouveau influences from the Mackintoshes and their impact on contemporary pattern design."}, "annotations": {"italic": true}}]
            }
          }
        ]
      }
    },
    {
      "object": "block",
      "type": "toggle",
      "toggle": {
        "rich_text": [{"type": "text", "text": {"content": "🎨 Graphic Design & Merch"}}],
        "children": [
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Creative Review: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "Coinbase dials up the craft in cinematic new ad", "link": {"url": "https://www.creativereview.co.uk/coinbase-oscars-ad-oscar-hudson-isle-of-any/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "Created by Isle of Any, the ad ran during yesterday's Oscars ceremony, offering a vision of financial freedom for those of us who are 'financial NPCs' in the computer game of life."}, "annotations": {"italic": true}}]
            }
          },
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Creative Review: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "Inside Ramdane Touhami's magical world of retail", "link": {"url": "https://www.creativereview.co.uk/ramdane-touhami-retail-magic-craft-innovation/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "As the prolific designer behind hundreds of retail spaces, including the exquisite Officine Universelle Buly 1803 perfumeries, Ramdane Touhami is focused on craft, detail and delivering innovative products with authenticity."}, "annotations": {"italic": true}}]
            }
          }
        ]
      }
    },
    {
      "object": "block",
      "type": "toggle",
      "toggle": {
        "rich_text": [{"type": "text", "text": {"content": "🎬 Film & Screenwriting"}}],
        "children": [
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Deadline: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "'Buffy' Autopsy Report: The Inside Story Of How High-Profile Reboot Was Shockingly Slayed", "link": {"url": "https://deadline.com/2026/03/buffy-inside-story-reboot-killed-why-sarah-michelle-gellar-1236757372/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "Almost every day last week, the studios on Hulu and Oscar winner Chloé Zhao's 'Buffy the Vampire Slayer' reboot were in touch with the project's producers indicating a pickup seemed imminent. By 6 p.m. Friday, the project was dead."}, "annotations": {"italic": true}}]
            }
          },
          {
            "object": "block",
            "type": "bulleted_list_item",
            "bulleted_list_item": {
              "rich_text": [
                {"type": "text", "text": {"content": "Deadline: "}, "annotations": {"bold": true}},
                {"type": "text", "text": {"content": "A24's 'Peaked' Adds Five To Cast", "link": {"url": "https://deadline.com/2026/03/peaked-movie-a24-casts-five-1236758503/"}}}
              ]
            }
          },
          {
            "object": "block",
            "type": "paragraph",
            "paragraph": {
              "rich_text": [{"type": "text", "text": {"content": "A24's new comedy Peaked, from Molly Gordon and Allie Levitan, has cast five more in supporting roles including Amy Sedaris, Owen Thiele, and Jaya Harper."}, "annotations": {"italic": true}}]
            }
          }
        ]
      }
    },
    {"object": "block", "type": "divider", "divider": {}},
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [{"type": "text", "text": {"content": "🎬 Film Grants & Opportunities"}}],
        "color": "purple_background"
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Published Mondays only. Next update: Monday, March 23, 2026."}, "annotations": {"italic": true}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Sources checked on Mondays: Women in Film & Video DC (WIFV.org), Film Independent, Sundance Institute, Screencraft, Women in Film LA, Creative Capital, Jerome Foundation, ITVS"}, "annotations": {"italic": true, "color": "gray"}}]
      }
    },
    {"object": "block", "type": "divider", "divider": {}},
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [{"type": "text", "text": {"content": "💼 Job Opportunities"}}],
        "color": "green_background"
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Published Wednesdays only. Next update: Wednesday, March 18, 2026."}, "annotations": {"italic": true}}
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {"type": "text", "text": {"content": "Target roles: Systems Strategist, Service Design, Design Ops, UX Leadership | Regions: EU, UK, US"}, "annotations": {"italic": true, "color": "gray"}}]
      }
    }
  ]
}
EOF