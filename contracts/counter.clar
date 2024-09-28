
;; title: counter
;; version:
;; summary:
;; description: Multiplayer Counter contract From the boot camp https://learn.stacks.org/path-player?courseid=clarity-camp&unit=clarity-camp_636082fa8bc67Unit
;; I was able to add a count-down function

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;
(define-map counters principal uint )

;; public functions
;;
(define-read-only (get-count (who principal))
    (default-to u0 (map-get? counters who))
)

(define-public (count-up)
    (ok (map-set counters tx-sender (+ (get-count tx-sender) u1)))
)

(define-public (count-down-to-0) 
    (let 
    ((count-value (get-count tx-sender))) 
     (if  (< count-value u1)
        (err "Invalid")
        (ok (map-set counters tx-sender (- count-value  u1)))
     )
    )
)


;; read only functions
;;

;; private functions
;;

