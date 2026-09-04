Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE7C79FAF
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7C010ED25;
	Tue,  8 Sep 2026 18:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="uJTRj0Pa";
	dkim-atps=neutral
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9209210FACC
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Sep 2026 11:48:39 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-939309d02d6so71900085a.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Sep 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788522518;
 x=1789127318; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fl9PTSUs9B7FCZMsxUqQ5YejuzDpmr3a9lkSBiQbIlE=;
 b=uJTRj0Pa6L4QLxM4Xg9d97ivckDacH6Fnur7Z2dZT5NKEdQxa5eZRcCcEKj+BlCOOi
 nWGxi/HXhF3JIPgf+hG0vpUkeNQgz2hkQNhyqY7sBKgPZQLGx6i2e3tqkSiWqDQ/bVHG
 HZMJj8pfZbgZPds2tihhvK2T+CBNKLWyTP0x35sgYq+U6liv2u4zL4R42X49hNwDm0ul
 BAgdX7/mJ9zrVH9QF+W8LT6VpQlH/GQP/Ux4KZ4jeoSv3PjzFMF793e2DZ7BBEZHb0ql
 0MHOTyQRy053HLzz1/vlCgHweMTlQDHB482tnHJhdzGzUDk3HJWRB7khSEDMRB7s7vqB
 p/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788522518; x=1789127318;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fl9PTSUs9B7FCZMsxUqQ5YejuzDpmr3a9lkSBiQbIlE=;
 b=mvrHW9Mvp/XdBDuhjkxi+yFhdpAS//yHa00cZGBVndN9ZsiIGp18Nq8JIy1IJgiFxP
 uRqnHzfzcpTDvZKF0C96tGqcbp7WLrQyDHwJwdWWWtyuefQgmokX2+/oyK8PMIPbpMR7
 sjpLqqseUh8UITTTOZupBKvykhXT18p/A5me60OJGNA0LciEehram7yb4YQWAftpFES9
 rDhCny0IuMxDgojhCgzN6d8DDncCFrH35FRdFrvet8Ed91FQwhQ+7mouMu6nq0DKJGFj
 Z6+EeTOcxZjRNh1w+A1Azdiv3zKUmsxcb1VSBm5lx7FXemOOb0e9vgFxo2Fudv7PRTTJ
 IKIg==
X-Gm-Message-State: AFuF++miiyzFDMu+NurTwitMYB/uEy+nAeSPG48bTdLPRH1yOxXwbVEs
 T94v143SeMnzz5P15ivYDAkH0d+hUC5wvM/A3hY+pORjkFmAXTQyQcEm9JBhLF/lLwC1bAvc5KT
 UQeva0PtknCerhktptCu4velzlOvW6S9DBT52wATHb3CR0GGPkC3oZGMhW84c2CRhjke5x9bvrV
 iriEGIDyTC7QdpU7Pe/x6AUTUkhFqdoRMaQP6l/OATF2CZ9+IR2EQVtSI=
X-Gm-Gg: AYBFou1H6JvF+vtzPVV0mZ28SUBAIPwOOO1jpNxUuzZC3KGu5rYf4irsGttK2/rg9e5
 9nEWCH6TnfH7UtG+OKGcCkv/vipiCgMEAyRIHYq/3gW4jMtlwQO/ZTG/YnhwlVDPJCZ7IlrvlxB
 mPsh8IeRMFgVxSIEsZnvqqituXLLiT5REAiwU6L7z0oXFYhOvV9F/yE+3L+QMrcdDLiTj1gk7PW
 yV6l5GDt13fOt+H7EbVo8EkKclTAHePiPrIoFjcNPwuubC/3Qd+UkweKWygGiAegjXFxUbPHjX3
 IAytFeZoSghrzo0NYtykUTPduDKbxVj77sqDgVEn7kSgQXPnWgbS7D4sZ0oiDNKxEXP5UN1u+K7
 Y7mzkeryBqZ7UuQKKpvs3cTektZ1MaGzwouqRBKAsdvLbILfrWaj23MnurLtbW8IopI1iepOGYr
 4HDj/VkAoD5/WVDU50ZbxEO3/oIGw0eVl/S7tkP1uaXWzYkZntp5dMR2CYyyWGlyA2iMz8SOkNY
 hIb2fXHvmHWNsFOUlV8RNhOWWmIl8OK8W3JXW9KhW0AsQVY9YjrORo9pRkZePKFYLP0VW2fronv
 UJFn1FtRnBYPQXFVJFmtPcNSrGKcz1isfdPhFNGHiSLRM7R3Y9C2miUicrfkHZNGoaDO
X-Received: by 2002:a05:620a:2606:b0:939:2d94:667c with SMTP id
 af79cd13be357-9398037ac4fmr542501585a.21.1788522518164; 
 Fri, 04 Sep 2026 04:48:38 -0700 (PDT)
Received: from jake-laptop ([153.67.39.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397f9f0734sm197825785a.4.2026.09.04.04.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:48:37 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Date: Fri,  4 Sep 2026 07:48:35 -0400
Message-ID: <20260904114835.483057-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904004308.185788-1-j@metarealtyinc.ca>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
 <20260904004308.185788-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:36 +0000
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

On Thu, 2026-09-04 Jouni Högander wrote:
> This patch doesn't help much ATM because we wont get rid of the quirk
> disabling selective fetch anyways.

Understood. Which quirk is that? As of yesterday's drm-tip this machine
only has the Panel Replay quirk; PSR2 with selective fetch is enabled,
and that is where these CRC errors show up. If selective fetch is going
to be quirked off for the DA16260 as well, then agreed, this can wait
until the SU problem is understood.

The SU problem is https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119.
I'd much rather see that fixed than another quirk on this machine, and
I can test whatever you want on it, same day.

Jake
