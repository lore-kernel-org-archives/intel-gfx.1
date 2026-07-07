Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA24EC43458
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Jul 2026 14:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F5710ED48;
	Tue,  7 Jul 2026 14:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="dEeGEhcy";
	dkim-atps=neutral
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70BD10ED48
 for <intel-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 14:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783433301; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BHNzlP6llTKuoxFyplEZuqPXJeRkjp5Lh72P70HmZnQn+eVC5hoMt9nikO80oXI7By1xjtHBkExpXNZR01w+S5yXZ3GmkDt96nPfE++oJ3hJBYZUdet3MNg+Hv2R/jhGoI1lc4lNZUePJE7hiILH7f9Fw/0vcQUz2Owk4taVSdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783433301;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=VDjGIETYL0y6ZZkaqeo/QDZccyOoWwEqkZayrBln7W0=; 
 b=a+b8hD0afzTe4oT1yQrMZ3iXMXYT9EDQ9cK4954PxtfTYIy7Dd4gt71/r2kO7siiEpWS6BjcSw6Cm14qk3eNRjtWCGj991mDwoKmHZMl1u4qt0oSfZzSDcKMDb9UcU405bbxmbEk8yCb4C70nSkUwnPDbXwFvqLeu1BE6onBq1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783433301; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=VDjGIETYL0y6ZZkaqeo/QDZccyOoWwEqkZayrBln7W0=;
 b=dEeGEhcyqynzLsN/1h9Dk1ZMNU7Joww7PI/eLKzY3RE1MqvDqD3FXgY/YbU88rNk
 MSo9N0Z/tWr2Ta3wDXX36fcw4+KiTlxJLmZD5r9A93JWn7wYdPE1ZFbkVBgl3zIkL9p
 XtgoLlAZY3ig8gJvstctoSG3ttEE3K+0RN/kYn2I=
Received: by mx.zohomail.com with SMTPS id 1783433298840663.5030295178424;
 Tue, 7 Jul 2026 07:08:18 -0700 (PDT)
Message-ID: <710a388461edb83346bd1c57b16fef11e3ea9b2d.camel@collabora.com>
Subject: XDC 2026: CfP deadline extended to July 15. Submit your talk,
 workshop or demo!
From: Mark Filion <mark.filion@collabora.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 07 Jul 2026 10:08:17 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

Hello!

The CfP deadline for talks, workshops and demos at XDC 2026 has been
extended to next Wednesday, 15 July 2026. You have one more week to
submit, don't wait!

https://indico.freedesktop.org/event/12/abstracts/

We're especially interested in talks across all layers of the graphics
stack, from the kernel to desktop environments and graphical
applications, and about how to make things better for the developers
who build them.=C2=A0

Worked on a cool project? Don't let the bar seem too high, you don't
need a polished, groundbreaking result to have something worth sharing.
If you're excited about it, chances are others will be too, so don't be
shy: submit your talk! Head to the CfP page to learn more.

As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

https://floss.social/@XOrgDevConf

Best,

Mark
