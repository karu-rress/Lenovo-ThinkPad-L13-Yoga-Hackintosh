# mount efi partition
sudo diskutil mount /dev/disk0s1

cd /Volumes/EFI/EFI/OC

<key>Misc</key>
	<dict>
		<key>BlessOverride</key>
		<array/>
		<key>Boot</key>
		<dict>
			<key>ConsoleAttributes</key>
			<integer>0</integer>
			<key>HibernateMode</key>
			<string>None</string>
			<key>HibernateSkipsPicker</key>
			<false/>
			<key>HideAuxiliary</key>
			<true/>
			<key>InstanceIdentifier</key>
			<string></string>
			<key>LauncherOption</key>
			<string>Disabled</string>
			<key>LauncherPath</key>
			<string>Default</string>
			<key>PickerAttributes</key>
			<integer>17</integer>
			<key>PickerAudioAssist</key>
			<false/>
			<key>PickerMode</key>
			<string>External</string>
			<key>PickerVariant</key>
			<string>Acidanthera\GoldenGate</string>
			<key>PollAppleHotKeys</key>
			<false/>
			<key>ShowPicker</key>
			<true/>
			<key>TakeoffDelay</key>
			<integer>0</integer>
			<key>Timeout</key>
			<integer>3</integer>
		</dict>
