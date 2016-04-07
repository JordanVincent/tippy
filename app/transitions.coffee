`import { animate } from "liquid-fire";`

anim = ->
  animate(@oldElement, { fontSize: '34px', lineHeight: '40px' })

revAnim = ->
  animate(@oldElement, { fontSize: '16px', lineHeight: '24px' })

transitions = ->

  @transition(
    @hasClass('step-activation'),
    @toValue(true),
    @use('explode',
      { pick: '.title', use: anim }
      { use: 'crossFade' }
    ),
    @reverse('explode',
      { pick: '.title', use: revAnim },
      { use: 'crossFade' }
    )
  )

`export default transitions`