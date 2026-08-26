Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD587C61DC4
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 19:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F9410EDD5;
	Wed, 26 Aug 2026 19:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=strategic9-se.20251104.gappssmtp.com header.i=@strategic9-se.20251104.gappssmtp.com header.b="NPTC/VkQ";
	dkim-atps=neutral
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B78510E32F
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 18:10:53 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6a5f1d0af69so1107291a12.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 11:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787767851; cv=none;
 d=google.com; s=arc-20260327;
 b=DuEG4ZhOLGGRGFdV/oPYxhK+ToQCcuhYW+Cldak0qqKMnOEnvP05UwqScgr5UQIsgR
 ykpl3Del/pxVsgM6CRk66x4rVQvEFkVtdz8GBue+ytbC9eTNR45yz/jkwM8gAk6j8kIL
 FF6nF4whRSK678qRDznHlrV8dbfK/hQMZioEBSIHmZDnq5GY4vjUrEID+JbExPEu+3xA
 NWohdTAlAA0pvNBhKZz71aZEvejb8k8+D8zTmeJ1R0URERls/EZC/p5cSiO4hoPLhEoj
 6Pp5FTxx2SINCN7NUVYurKxxvr6WuEwq84clO0C0K+UfLXeWYhF+DiPrj47jLibYZSQh
 At6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=hg0NQa9P5fJYv7Z19wNgbalnfTR4foR0IhUU1pWe+fg=;
 fh=0mq9d1JUrcYsoTTkGHiTtQVhfUtVmM5T3dWmSoFUk5Y=;
 b=L8JGO9rFKuIxkC+MbQrHLsBdxu7VaSyOHkbiiFjKN9sPESEKExhgEkLs8ycE8doGkm
 cPrnWzNBbiPz68zP89nP00kuAMoaSvUbSdyC/zzaz7Ar2NkNA3s3V8JFke+lrKCzrxaD
 bNgnjLaxNV0Awx3kLWG9DjuyBSTpc7Q57bf+lEZ6XgWO87M0zUFJxqJXCEdEzQ4cjL1z
 9Na+QwWOko/21lY61SHm6Oaywsa0O/60NufQ6ndBfx5qGIBI3pC6qPgjZcYSrZwb8mQA
 WoIkn7BhD7lodEgR+6SnwHjSUoEcFGqWOwEEXnQEUfXfASCfM1d3KbUvkZfrd8TG6uGU
 2hjQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=strategic9-se.20251104.gappssmtp.com; s=20251104; t=1787767851; x=1788372651;
 darn=lists.freedesktop.org; 
 h=content-type:to:subject:message-id:date:from:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=hg0NQa9P5fJYv7Z19wNgbalnfTR4foR0IhUU1pWe+fg=;
 b=NPTC/VkQ/OXkpH15M8NzyF5s+/WycHkqRXaJoL2jbhqrK8X7XOfKE5LEaEjh2MiM58
 805ujKXFSZw8OD/2I0QLiFPvrttcU9Y2HDTu8q081OgrMDiCU7P/+5JsOh4NEycrcGwq
 bV34d7w9oya1ASOsPDwGwnEsXNuJIO58WVqg4jw0YJcbq4JlerkQGStl4ADMtsQBXdI8
 DwYZnZtNTxUz4oB9Al78h2yWO4QIUAQwUO7mIoA3D50GPcRLLC+acqp/Flt7K3DEWpgz
 3qhpUgd/yW6kOkJv4QlNY5bBJAPVGC7P9pfDzzV45sVoGLo+39PPF5yGPZFNYlJYxXw0
 MNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787767851; x=1788372651;
 h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hg0NQa9P5fJYv7Z19wNgbalnfTR4foR0IhUU1pWe+fg=;
 b=FN4j3VI8NWl+6xuk6GRqI2ISsvgZ9+fJUisXd2QGgyO3FrkjWN3EXfYJJc6K/QjTC1
 iIm+RrTuPnnVXO4G+Sr+GXc/goVTFhJ/rpDJsGhLWkITRttgs9Ai28yhQG2uDfhEGJm2
 w7wkzQpYXOxiohtbu9llrYk9oH3nXkMT5i0jId6v226v1Z087G1fssiF3gSSCmbAbtGq
 ruSxS/FBS504kaFPbg4V524TIMQJpy1IGHjhojzfF9VcLzKWZA64vFU+WsqZ+NW0LKej
 uA+RQH3ClRw/YJa/8Qi2+kCjMe7xccNVWVWf16p+XrPKa+kZd+K0OoarpU+Iz39TzmW/
 WbfA==
X-Gm-Message-State: AFuF++nzeW0cA+vgPUXeT7rRvQ9vjBOnoUKDQQeOCprUFMDbYWi0lyqa
 ImKtX59eT+oJb8PMvNSUqIPOOLy9dd4AZ8GhyKavwRRn276e9nNYqJnaHHsNLzZmUjFPBhd7Jky
 FVDXjXQ1+drbpv+J7LgJaLpiYT1rfaLWz0+N2hebkekpSzHL0Zc1Vn0Q=
X-Gm-Gg: AR+sD11Yw38BoAl+RpKw2Qe8Ub8yGHANZ7bch6aGsDsIFJuk3VeKFZJvPv/LY249nYw
 PhMyt9XVfybXHJPghQnn0wD3TPvQtDtbodb0s0WILs+MLtEVx1Ax4TDaZ/xrsI4e+P1QNp6JKt3
 SDUXtvELMrHNWvipXOxNs8Q3czkTmfQ+TKOdd6XRf2XIcnwhx+iaBGgGVF7FYeXh9N704iXB1SF
 4Q/u5NZLAlC/zQywFJsCeUJ9ozSRIo27UTd1jPiF/aVDoay31ea/e42m9+RextTTxf/d3ndtMVJ
 vKLoUUwXxcPtDESNzvq/QPJ6gM/vfjkXKXBttmg+8r9xXxdcX20ay6v5Sg==
X-Received: by 2002:a05:6402:21db:b0:69c:76c6:9bef with SMTP id
 4fb4d7f45d1cf-6a5df63428amr11254729a12.10.1787767851252; Wed, 26 Aug 2026
 11:10:51 -0700 (PDT)
MIME-Version: 1.0
From: Fredrik Nicol <fredrik.nicol@strategic9.se>
Date: Wed, 26 Aug 2026 20:10:39 +0200
X-Gm-Features: AcwNN1Vf1I9_sofNyWGOcSHHns0PjCOqECHvWjuIEFXwR6pVxjaxQAzpfWpWHoU
Message-ID: <CAE3tsCV8SS0Tb51Wj=nuh9pJ=fLMwc=4qswFec3_dw7dHT6D5Q@mail.gmail.com>
Subject: Panther Lake (b082) eDP tearing tied to Panel Replay/selective-fetch, 
 Anapass T-Con (OUI ba:41:59)
To: intel-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000b70f960659f72343"
X-Mailman-Approved-At: Wed, 26 Aug 2026 19:47:01 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--000000000000b70f960659f72343
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm running into a persistent display bug on a Panther Lake handheld
(OneXPlayer 3, GPU device ID 8086:b082) that I've traced fairly deep into
the xe driver's Panel Replay/selective-fetch path, and I wanted to get this
in front of someone who can actually act on it rather than let it sit
undocumented. I'm a developer, not a kernel contributor, so apologies if
some of this is presented a bit sideways from how you'd normally see a bug
report, but I've tried to keep everything here verifiable.

Hardware: internal panel is Samsung Display AMS881KB01-0, 8.8" AMOLED,
1920x1200 up to 144Hz. The panel controller (confirmed by reading the sink
IEEE OUI directly off the eDP AUX channel at DPCD 0x400) is Anapass Inc.,
OUI ba:41:59. EDID reports native 12bpc and BT2020/PQ HDR static metadata.
Notably this is the exact same panel model used in the Lenovo Legion Go 2,
which runs AMD hardware and doesn't appear to have this issue, so I don't
think the panel itself is at fault.

Symptom: visible tearing and garbled pixel regions on the internal display,
worse during motion (scrolling, animation, gameplay), still present but
less frequent when the screen is static. Confirmed independently on two
separate distros (CachyOS and a stock Bazzite live session), so it isn't
something specific to my install.

The dmesg signature, first appearing during early boot and recurring on
subsequent modesets:

xe 0000:00:02.0: [drm] Port A asks to use VBT vswing/preemph tables
WARNING: drivers/gpu/drm/i915/display/intel_bios.c:2788 at intel_bios_init
xe 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
xe 0000:00:02.0: [drm] *ERROR* [CRTC:151:pipe A] mismatch in vsc dp vsc sdp
expected: BT.2020 RGB, bpc: 10
found: sRGB, bpc: 0
pipe state doesn't match!

(stack through intel_modeset_verify_crtc / intel_atomic_commit_tail,
Workqueue: i915_modeset intel_atomic_commit_work)

I ran a full bisection across the relevant xe module parameters, each
tested in isolation and in combination, confirmed via
/sys/kernel/debug/dri/.../eDP-1/i915_psr_status after each boot rather than
assumed from the parameter alone:

xe.enable_psr=0 + xe.enable_psr2_sel_fetch=0 + xe.enable_panel_replay=0:
black screen, no display
xe.enable_psr2_sel_fetch=0 alone: black screen
xe.enable_psr=0 + xe.enable_panel_replay=0 (sel_fetch left on): black screen
xe.enable_panel_replay=0 alone: display works, tearing persists (confirmed
fallback to PSR1 via psr_status)
xe.enable_psr=0 alone: display works, tearing persists

So there's no combination of these three flags that gives a working,
tear-free display. Anything that disables selective-fetch takes the modeset
down entirely, and anything that leaves it enabled still tears. That felt
like the most useful concrete result to hand over, since it rules out a
boot-parameter workaround existing at all on this hardware.

One more thing worth flagging: this is intermittent, not deterministic.
Identical kernel, identical boot parameters, identical hardware has
produced different outcomes across separate boots, and switching between
gamescope and a desktop compositor session reliably re-triggers a fresh
roll of the dice. I also have one report from someone with a
confirmed-identical OUI (ba:41:59, verified the same way) who says they
don't see this at all on the same kernel version, so whatever margin this
is riding on isn't purely software-version-gated.

I'm aware there's already a precedent for handling this class of problem,
the QUIRK_DISABLE_PANEL_REPLAY / intel_dpcd_quirks[] entry added for the
Dell XPS 14's panel (OUI 00:22:b9). I haven't found anything in that table
for ba:41:59, and given how closely this matches (down to the exact same
"Selective fetch area calculation failed in pipe A" line) what's been
separately reported on at least one other OEM's Panther Lake machine with a
different panel entirely, I think this may be a broader selective-fetch
issue rather than something isolated to my specific panel.

Happy to pull more logs, test patches, or run anything else that would help
narrow this down. I've got full dmesg captures from multiple boots, the raw
EDID dump, and the psr_status output from each of the bisection runs above
if useful.

Thanks for reading this far.
Fredrik

--000000000000b70f960659f72343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<br><br>I&#39;m running into a persistent display bug =
on a Panther Lake handheld (OneXPlayer 3, GPU device ID 8086:b082) that I&#=
39;ve traced fairly deep into the xe driver&#39;s Panel Replay/selective-fe=
tch path, and I wanted to get this in front of someone who can actually act=
 on it rather than let it sit undocumented. I&#39;m a developer, not a kern=
el contributor, so apologies if some of this is presented a bit sideways fr=
om how you&#39;d normally see a bug report, but I&#39;ve tried to keep ever=
ything here verifiable.<br><br>Hardware: internal panel is Samsung Display =
AMS881KB01-0, 8.8&quot; AMOLED, 1920x1200 up to 144Hz. The panel controller=
 (confirmed by reading the sink IEEE OUI directly off the eDP AUX channel a=
t DPCD 0x400) is Anapass Inc., OUI ba:41:59. EDID reports native 12bpc and =
BT2020/PQ HDR static metadata. Notably this is the exact same panel model u=
sed in the Lenovo Legion Go 2, which runs AMD hardware and doesn&#39;t appe=
ar to have this issue, so I don&#39;t think the panel itself is at fault.<b=
r><br>Symptom: visible tearing and garbled pixel regions on the internal di=
splay, worse during motion (scrolling, animation, gameplay), still present =
but less frequent when the screen is static. Confirmed independently on two=
 separate distros (CachyOS and a stock Bazzite live session), so it isn&#39=
;t something specific to my install.<br><br>The dmesg signature, first appe=
aring during early boot and recurring on subsequent modesets:<br><br>xe 000=
0:00:02.0: [drm] Port A asks to use VBT vswing/preemph tables<br>WARNING: d=
rivers/gpu/drm/i915/display/intel_bios.c:2788 at intel_bios_init<br>xe 0000=
:00:02.0: [drm] Selective fetch area calculation failed in pipe A<br>xe 000=
0:00:02.0: [drm] *ERROR* [CRTC:151:pipe A] mismatch in vsc dp vsc sdp<br> e=
xpected: BT.2020 RGB, bpc: 10<br> found: sRGB, bpc: 0<br>pipe state doesn&#=
39;t match!<br><br>(stack through intel_modeset_verify_crtc / intel_atomic_=
commit_tail, Workqueue: i915_modeset intel_atomic_commit_work)<br><br>I ran=
 a full bisection across the relevant xe module parameters, each tested in =
isolation and in combination, confirmed via /sys/kernel/debug/dri/.../eDP-1=
/i915_psr_status after each boot rather than assumed from the parameter alo=
ne:<br><br>xe.enable_psr=3D0 + xe.enable_psr2_sel_fetch=3D0 + xe.enable_pan=
el_replay=3D0: black screen, no display<br>xe.enable_psr2_sel_fetch=3D0 alo=
ne: black screen<br>xe.enable_psr=3D0 + xe.enable_panel_replay=3D0 (sel_fet=
ch left on): black screen<br>xe.enable_panel_replay=3D0 alone: display work=
s, tearing persists (confirmed fallback to PSR1 via psr_status)<br>xe.enabl=
e_psr=3D0 alone: display works, tearing persists<br><br>So there&#39;s no c=
ombination of these three flags that gives a working, tear-free display. An=
ything that disables selective-fetch takes the modeset down entirely, and a=
nything that leaves it enabled still tears. That felt like the most useful =
concrete result to hand over, since it rules out a boot-parameter workaroun=
d existing at all on this hardware.<br><br>One more thing worth flagging: t=
his is intermittent, not deterministic. Identical kernel, identical boot pa=
rameters, identical hardware has produced different outcomes across separat=
e boots, and switching between gamescope and a desktop compositor session r=
eliably re-triggers a fresh roll of the dice. I also have one report from s=
omeone with a confirmed-identical OUI (ba:41:59, verified the same way) who=
 says they don&#39;t see this at all on the same kernel version, so whateve=
r margin this is riding on isn&#39;t purely software-version-gated.<br><br>=
I&#39;m aware there&#39;s already a precedent for handling this class of pr=
oblem, the QUIRK_DISABLE_PANEL_REPLAY / intel_dpcd_quirks[] entry added for=
 the Dell XPS 14&#39;s panel (OUI 00:22:b9). I haven&#39;t found anything i=
n that table for ba:41:59, and given how closely this matches (down to the =
exact same &quot;Selective fetch area calculation failed in pipe A&quot; li=
ne) what&#39;s been separately reported on at least one other OEM&#39;s Pan=
ther Lake machine with a different panel entirely, I think this may be a br=
oader selective-fetch issue rather than something isolated to my specific p=
anel.<br><br>Happy to pull more logs, test patches, or run anything else th=
at would help narrow this down. I&#39;ve got full dmesg captures from multi=
ple boots, the raw EDID dump, and the psr_status output from each of the bi=
section runs above if useful.<br><br>Thanks for reading this far.<div dir=
=3D"auto">Fredrik<br>=C2=A0</div></div>

--000000000000b70f960659f72343--
