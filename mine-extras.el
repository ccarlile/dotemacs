(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
        '(("https://www.archlinux.org/feeds/news/" arch linux)
          ("https://xkcd.com/rss.xml" fun comic)
          ("https://www.smbc-comics.com/rss.php" fun comic)
          ("http://kernel.org/kdist/rss.xml" linux)
          ("https://reddit.com/r/netflixbestof/.rss" fun netflix))))

(use-package md4rd
  :ensure t)

(provide 'mine-extras)
