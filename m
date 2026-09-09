Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B88C88E47
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2D710F4BD;
	Thu, 10 Sep 2026 14:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W1vAYdNT";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6EE10E227
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 19:41:41 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b4ba7fe26so2446805e9.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 09 Sep 2026 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788982900; x=1789587700; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BMV0mMGaUxuAC5co0uH2uhYqExWWNSi7vJ8S06jVFgM=;
 b=W1vAYdNT03QcmCM0abY/2+j1pBXDbIWA6QNYGRlKzJfUAowxews0Bquh0vcmZH52V3
 YnPhZv131AVNiXi9HES5P/jFlvHXeW6qhR7MqxfggWKN3iNflTPpfnvwQHZ6v+Z8k67w
 CXOfrcVUlSmublkVBYsTAuQjw8gs3cACKmUlEWfFDI0s+2ZSInYbgFyATnUJnFe1U/Cc
 2wufGZ6hBBhlOUByF0tVsZF/I3AfDr87nB7OmDKgRV8EywuxCw2Ql+Bpha+0QViSSBUD
 XoQByjh19CxDw9Tu7KsLV+QQ+iyBzQDE8BzBrnoGlGQb4Ha7ROHY2fxKXq2PJQ0RXwHZ
 vVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788982900; x=1789587700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BMV0mMGaUxuAC5co0uH2uhYqExWWNSi7vJ8S06jVFgM=;
 b=W/SzmpK+I1woXMk74Xw+vAmgp6eyA2jHNt+TE2vyhfSi6stkh42jGdq/MmWDcacHkB
 7qMhLdfAJRreUu4LNIg7hLhRzHYUF02y+QpuADZKe5jgLNKqSvbIX/L3E9FoBERRdu0Z
 3p4SS58356wNdC8gUdIsdxG8K+VgKbKJ0/N27XFxaJfh4DxPGEnhzDZog0jKCpIrtUZz
 k4e5U84mcpZmJruR5D8EITDFohShsboU/T6ryAOKFPpYS57tN1rrCDY8kpu4iQZbVupi
 oZbA7+3wjXQ9sr2UshAw4PvEWx3uBWckjPgylDA+CPHftPyc8yKauI1dgHaOcy2xuS/o
 9W+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdaDy4vnFLNlUGgzZN8pinosERRRpzLJE4TxUMvCg/SyN5wFY6T3HF5UC2tcfnR+rjWD980u8k78U=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lU6hh1pPbhDhchEb7V0/wA208rWUeTl2J9uLQ3eI9l2T7chAQS
 f3TIvOVPXeR5e5GM+p5HxgOMalhZPOLNz7fXuk8tbsvp1cOAPTX6FiXl
X-Gm-Gg: AYBFou2n7Kx4th7BVvex1mL55ouDiqukAZEOgtumFchGwMDPd1JaIA1bEvEGtBIZbKU
 k7VdD4SeKivuSx5fsmVpowufyxPz9CC1xOZLAt6wd20lTddwM5errAMtggGXC1tzuNV7k83au5b
 Z1S/IcM4VAbTw9+LX2TWG6w+3ZCnQjSZ2dn8DQ/z0O9KnIvQzLrfBL8/UgXoMMiwRjYxYbDicwZ
 ZIaxu3W8UMymbyXps8hgC47kjMM4JZwMFxjbww0GboDJlW8LMbj7G2Aax9XnABUC7mVUapB1XVM
 6OaZFYj3jzMzrDFJCTmATGpJh6VNF63LyDJxPj68hluOtSnD6s1AtUgZx0YMcjRyMBEy4eDQd2f
 t51ehPngEVA3Xz3Dk38bUzPcxk3ixYayr+HDJdqWAmnDsk4ts0u2JRPWu3eTImrKY6N/eu1lYMz
 iPdtO71CA7td72F4rF9PkHpZru5zh99L+WycOWxn6hin/vJwe4KTZ1n9hYNj7am1h2GPsZ8SkbO
 Lp18t6bSjTRY718Bofso18BwhPn6iVZ0EUb0JDgMHXLzBAN9RP1/kqmoC9wXr6yojHTmEoDTkIv
 hZq4
X-Received: by 2002:a05:600c:474a:b0:49c:ff81:e062 with SMTP id
 5b1f17b1804b1-49d276628c8mr3990025e9.2.1788982899647; 
 Wed, 09 Sep 2026 12:41:39 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME
 (20014C4E1B836900C06E5685D4591C35.dsl.pool.telekom.hu.
 [2001:4c4e:1b83:6900:c06e:5685:d459:1c35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fce7a7sm167161505e9.4.2026.09.09.12.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 12:41:38 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector
 property
Date: Wed,  9 Sep 2026 21:40:35 +0200
Message-ID: <20260909194036.8889-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909173542.14030-4-royalnet026@gmail.com>
References: <20260909173542.14030-4-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Sep 2026 14:24:20 +0000
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

The bot is right, and it is worse than it reported. I went and read the
code rather than taking either its word or my own.

drm_bridge_connector_init() has two paths. With an HDMI bridge in the
chain it calls drmm_connector_hdmi_init() (drm_bridge_connector.c:1016);
otherwise drmm_connector_init() (:1027). And drmm_connector_hdmi_init()
already contains, at drm_connector.c:621-631, the exact block this patch
adds - same shape, same comment, because that is where I took it from -
and then calls drm_connector_attach_max_bpc_property() itself at :633.

So on a chain with an HDMI bridge my patch does two wrong things, not
one:

 - it overwrites a connector->state that has just been allocated, which
   is the leak the bot found;

 - it calls drm_connector_attach_max_bpc_property() a second time. That
   one is not a leak: the helper reuses connector->max_bpc_property when
   it already exists, so my 6..10 range is silently discarded and the
   8..max_bpc property created by the HDMI path stays. It does re-attach
   the same property to the object and overwrite state->max_bpc.

On the boards I care about there is no HDMI bridge behind dw-dp, so
neither fires today - but "does not fire on my board" is not a reason to
leave it.

For v3 both blocks get guarded on what is already there:

	if (!connector->state) {
		... create the state ...
	}

	if (!connector->max_bpc_property) {
		ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
		...
	}

That leaves a question I would rather ask than paper over. The state
creation exists only in drmm_connector_hdmi_init(), while
drm_bridge_connector_init() leaves the plain path without a state - so
any bridge driver that wants a connector property at bind time has to
copy that block, as I did. Would it be better to move it into
drm_bridge_connector_init() so both paths get a state, and have drivers
just attach their properties? I am happy to write that instead, but it
touches shared code and I would rather be told than guess.

On the pre-existing [High]: the bot is right that the error path I add
inherits it. dw_dp_bind() takes devm resources on the component device,
including a non-shared devm_request_threaded_irq(), so a failed bind
leaves them held and the retry gets -EBUSY. My dw_dp_unbind() call does
not release devres. With the guards above the new path becomes hard to
reach, but it does not stop being wrong, and I did not introduce it.
I can send a separate patch moving those to the master device if the
maintainers want it - it is a different change from this one.

Igor
