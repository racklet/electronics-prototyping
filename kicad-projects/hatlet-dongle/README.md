# hatlet-dongle

hatlet-dongle is a small adapter board that allows you to connect a hatlet to a development host PC without a full backplane. In essence, it is a backplane-side breakout board of the racklet backplane connector with:
- USB type C connector for D+/D- and +5VSB power input,
- Banana jacks for supplies
  - +12V SBC supply
  - +5V SBC supply
  - +5VSB management power supply
  - ground

A pin jumper is used to select the source of the +5VSB supply between:
- USB type C connector
- Banana jack

## Pictures
<table>
    <tr>
        <th>Front</th>
        <th>Back</th>
    </tr>
    <tr>
        <td><img alt="hatlet-dongle front view" src=./pictures/hatlet-dongle-0.1.0-front-alpha.png></td>
        <td><img alt="hatlet-dongle back view" src=./pictures/hatlet-dongle-0.1.0-back-alpha.png></td>
    </tr>
</table>

