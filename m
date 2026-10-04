Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F3DCA6005
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 23:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD7010EF17;
	Mon,  5 Oct 2026 23:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ssl01.alldomains.hosting header.i=@ssl01.alldomains.hosting header.b="FaITb+8y";
	dkim-atps=neutral
X-Greylist: delayed 391 seconds by postgrey-1.36 at gabe;
 Sun, 04 Oct 2026 14:16:19 UTC
Received: from ssl01.alldomains.hosting (ssl01.alldomains.hosting
 [213.145.224.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90F010E111
 for <intel-gfx@lists.freedesktop.org>; Sun,  4 Oct 2026 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ssl01.alldomains.hosting; s=dkim; h=From:Sender:To:Cc:
 References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:
 Content-Language; bh=8MMSbuJS8ytKdErK9zAh/TTx8rgGnZVqMXooBceacM8
 =; b=FaITb+8yLtboBr8ma1OnyeyHTBDWRW1sDhSirXV0kzvrw0bNgLCTu3mlfGV
 kkJRipBAwqitQkKDXoDraEUHKeltQTgzLJwUG8UFOgd3KowzW7F1FHkwVg4hRDOX
 166RNbtpysWZJf9xc65IiIR63MKmeQpBKrKb0uA+8YlvBZ0LW3Y3o9K5aHp9P0J9
 XrUVdQ6X/6M91VjUlxJ9tR0A3KG7pE6JwX6asF+IhAH5Em0EJkRNiqkydt6JK3tT
 u4nbPC0yG7LGwFvqnofqqjqEi9YzL6bAxxUwF1gEHXjxBpao5Liut0xsz+8K/9xN
 eWAZitEx9nS7AG6cFXHCh9mdANQ==
Received: (qmail 273297 invoked by uid 7799); 4 Oct 2026 16:09:36 +0200
Received: by simscan 1.4.0 ppid: 273285, pid: 273294, t: 0.1207s
 scanners: clamav: 1.4.3/m:63/d:28143
Received: from unknown (HELO ROG) (michael@dittrich.top@94.31.113.139) by
 ssl01.alldomains.hosting with SMTP [4834]; 4 Oct 2026 16:09:35 +0200
From: <linux-kernel@dittrich.top>
To: <intel-gfx@lists.freedesktop.org>
Cc: <krzysztof.karas@intel.com>
References: <20260911061145.3535489-1-krzysztof.karas@intel.com>
In-Reply-To: <20260911061145.3535489-1-krzysztof.karas@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Prevent overstepping exec array boundary
Date: Sun, 4 Oct 2026 16:09:35 +0200
Message-ID: <034701dd5409$fca1e490$f5e5adb0$@dittrich.top>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1UBfNGp7hj7fqHQrWsNxp4HOCNlw==
Content-Language: de
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:53:28 +0000
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

Hi,

I observed repeated kfree() Oopses in eb_relocate_parse_slow() during VAAPI
video processing on real Haswell hardware (8086:0412) on Debian
6.12.107+deb13-amd64.

After applying 2a0158925fb9 ("drm/i915/gem: Prevent overstepping exec array
boundary") and verifying the loaded module, VAAPI decode/scale/H.264 encode
and full video analyses completed. The previous Oops did not recur and no
new
kernel/GPU error was detected in these runs.

Please carry this already accepted fix into mainline and the affected
stable/LTS branches, particularly 6.12. I see it already has
Cc: stable #5.10+.

AI assistance was used for log/source analysis, test automation and
drafting; the reported tests ran on actual hardware.

Thanks.

