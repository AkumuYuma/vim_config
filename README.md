# Configurazioni personali vim.
Praticamente le stesse configurazioni di neovim ma valide per vim. La differenza principale è che non ci sono telescope e coc, essendo disponibili solo per nvim.
Inoltre risolte alcune incompatibilità tra vim e tmux come ad esempio il fatto che il cursore è sempre una linea a prescindere dalla modalità.

# Come usare queste configurazioni:
Se sei in un ambiene UNIX vergine, con git e vim installati:
* `mkdir ~/.vim;` (Se non esiste)
* `git clone https://github.com/AkumuYuma/vim_config.git ~/.vim` Per clonare le configurazioni
* Aprire vim e usare il comando `:PlugInstall`

In pratica clonando il repository stai prendendo solo il file vimrc e il plugin manager (per poter installare i plugin).
I plugin in sé (cioè i vimscript corrispondenti) non sono caricati sul repo perchè sarebbero troppo grandi.

Nota: Al momento della scrittura l'ultima versione stabile di vim è la 8.1
