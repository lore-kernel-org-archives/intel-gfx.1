Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6939C41604
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 15:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DF9206D4
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 15:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35DF9206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4B6E217;
	Tue,  6 Oct 2020 15:21:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 862706E15E;
 Tue,  6 Oct 2020 15:21:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7DED0A8831;
 Tue,  6 Oct 2020 15:21:39 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Tue, 06 Oct 2020 15:21:39 -0000
Message-ID: <160199769948.18760.2434539472720850421@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201006143349.5561-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20201006143349.5561-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBk?=
 =?utf-8?q?rm/i915=3A_Futher_cleanup_around_hpd_pins_and_port_identfiers?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogZHJtL2k5MTU6IEZ1dGhlciBjbGVhbnVwIGFy
b3VuZCBocGQgcGlucyBhbmQgcG9ydCBpZGVudGZpZXJzClVSTCAgIDogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MjQxMS8KU3RhdGUgOiBmYWlsdXJlCgo9PSBTdW1t
YXJ5ID09CgpDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNjYWxscy5zaAogIENBTEwgICAgc2NyaXB0
cy9hdG9taWMvY2hlY2stYXRvbWljcy5zaAogIERFU0NFTkQgIG9ianRvb2wKICBDSEsgICAgIGlu
Y2x1ZGUvZ2VuZXJhdGVkL2NvbXBpbGUuaAogIENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2Rpc3BsYXkubwpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jOiBJbiBmdW5j
dGlvbiDigJhlbXVsYXRlX21vbml0b3Jfc3RhdHVzX2NoYW5nZeKAmToKZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2Rpc3BsYXkuYzoxNzY6NDQ6IGVycm9yOiDigJhCWFRfREVfUE9SVF9IUF9ERElB
4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFu
IOKAmFRHTF9ERV9QT1JUX0FVWF9ERElB4oCZPwogICB2Z3B1X3ZyZWdfdCh2Z3B1LCBHRU44X0RF
X1BPUlRfSVNSKSAmPSB+KEJYVF9ERV9QT1JUX0hQX0RESUEgfAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUR0xfREVfUE9SVF9BVVhfRERJQQpkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jOjE3Njo0NDogbm90ZTogZWFjaCB1bmRlY2xh
cmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0
IGFwcGVhcnMgaW4KZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYzoxNzc6NDogZXJy
b3I6IOKAmEJYVF9ERV9QT1JUX0hQX0RESULigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYQlhUX0RFX1BPUlRfSFBfRERJQeKAmT8KICAg
IEJYVF9ERV9QT1JUX0hQX0RESUIgfAogICAgXn5+fn5+fn5+fn5+fn5+fn5+fgogICAgQlhUX0RF
X1BPUlRfSFBfRERJQQpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jOjE3ODo0OiBl
cnJvcjog4oCYQlhUX0RFX1BPUlRfSFBfRERJQ+KAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4g
dGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhCWFRfREVfUE9SVF9IUF9ERElC4oCZPwog
ICAgQlhUX0RFX1BPUlRfSFBfRERJQyk7CiAgICBefn5+fn5+fn5+fn5+fn5+fn5+CiAgICBCWFRf
REVfUE9SVF9IUF9ERElCCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmM6MzMwOjU6
IGVycm9yOiDigJhHRU44X1BPUlRfRFBfQV9IT1RQTFVH4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmERFX0RQX0FfSE9UUExVR+KAmT8K
ICAgICBHRU44X1BPUlRfRFBfQV9IT1RQTFVHOwogICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
ICAgICBERV9EUF9BX0hPVFBMVUcKc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyODM6IHJlY2lwZSBm
b3IgdGFyZ2V0ICdkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5vJyBmYWlsZWQKbWFr
ZVs0XTogKioqIFtkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5vXSBFcnJvciAxCnNj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTAwOiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUv
ZHJtL2k5MTUnIGZhaWxlZAptYWtlWzNdOiAqKiogW2RyaXZlcnMvZ3B1L2RybS9pOTE1XSBFcnJv
ciAyCnNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTAwOiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVy
cy9ncHUvZHJtJyBmYWlsZWQKbWFrZVsyXTogKioqIFtkcml2ZXJzL2dwdS9kcm1dIEVycm9yIDIK
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1MDA6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dw
dScgZmFpbGVkCm1ha2VbMV06ICoqKiBbZHJpdmVycy9ncHVdIEVycm9yIDIKTWFrZWZpbGU6MTc4
NDogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMnIGZhaWxlZAptYWtlOiAqKiogW2RyaXZlcnNd
IEVycm9yIDIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
