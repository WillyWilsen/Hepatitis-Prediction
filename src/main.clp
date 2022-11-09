;Otomasi pekerjaan memprediksi hepatitis

;Left Tree

;Input HBsAg
(defrule is-HBsAg
=>
(printout t "HBsAg? ")
(assert (HBsAg (read))))

;Input anti-HDV
(defrule is-anti-HDV
(HBsAg positive)
=>
(printout t "anti-HDV? ")
(assert (anti-HDV (read))))

;Hepatitis B+D
(defrule diduga-Hepatitis-B+D
(and (HBsAg positive)
(anti-HDV positive))
=>
(printout t crlf "Hasil Prediksi = Hepatitis B+D" crlf))

;Input anti-HBc
(defrule is-anti-HBc-left
(and (HBsAg positive)
(anti-HDV negative))
=>
(printout t "anti-HBc? ")
(assert (anti-HBc (read))))

;Input anti-HBs
(defrule is-anti-HBs-left
(and (HBsAg positive)
(anti-HDV negative)
(anti-HBc positive))
=>
(printout t "anti-HBs? ")
(assert (anti-HBs (read))))

;Uncertain configuration
(defrule diduga-uncertain-configuration-anti-HBc
(and (HBsAg positive)
(anti-HDV negative)
(anti-HBc negative))
=>
(printout t crlf "Hasil Prediksi = Uncertain configuration" crlf))

;Uncertain configuration
(defrule diduga-uncertain-configuration-anti-HBs
(and (HBsAg positive)
(anti-HDV negative)
(anti-HBc positive)
(anti-HBs positive))
=>
(printout t crlf "Hasil Prediksi = Uncertain configuration" crlf))

;Input IgM anti-HBc
(defrule is-IgM-anti-HBc
(and (HBsAg positive)
(anti-HDV negative)
(anti-HBc positive)
(anti-HBs negative))
=>
(printout t "IgM anti-HBc? ")
(assert (IgM-anti-HBc (read))))

;Acute infection
(defrule diduga-Acute-infection
(and (HBsAg positive)
(anti-HDV negative)
(anti-HBc positive)
(anti-HBs negative)
(IgM-anti-HBc positive))
=>
(printout t crlf "Hasil Prediksi = Acute infection" crlf))

;Chronic infection
(defrule diduga-Chronic-infection
(and (HBsAg positive)
(anti-HDV negative)
(anti-HBc positive)
(anti-HBs negative)
(IgM-anti-HBc negative))
=>
(printout t crlf "Hasil Prediksi = Chronic infection" crlf))

;Right Tree

;Input anti-HBs
(defrule is-anti-HBs-right
(HBsAg negative)
=>
(printout t "anti-HBs? ")
(assert (anti-HBs (read))))

;Input anti-HBc
(defrule is-anti-HBc-right
(and (HBsAg negative)
(or (anti-HBs positive)
(anti-HBs negative)))
=>
(printout t "anti-HBc? ")
(assert (anti-HBc (read))))

;Cured
(defrule diduga-Cured
(and (HBsAg negative)
(anti-HBs positive)
(anti-HBc positive))
=>
(printout t crlf "Hasil Prediksi = Cured" crlf))

;Vaccinated
(defrule diduga-Vaccinated
(and (HBsAg negative)
(anti-HBs positive)
(anti-HBc negative))
=>
(printout t crlf "Hasil Prediksi = Vaccinated" crlf))

;Unclear (possible resolved)
(defrule diduga-Unclear
(and (HBsAg negative)
(anti-HBs negative)
(anti-HBc positive))
=>
(printout t crlf "Hasil Prediksi = Unclear (possible resolved)" crlf))

;Healthy not vaccinated or suspicious
(defrule diduga-Healthy-not-vaccinated-or-suspicious
(and (HBsAg negative)
(anti-HBs negative)
(anti-HBc negative))
=>
(printout t crlf "Hasil Prediksi = Healthy not vaccinated or suspicious" crlf))