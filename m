Return-Path: <SRS0=c36g=FR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E0EC433FE
	for <intel-gfx@archiver.kernel.org>; Sun, 13 Dec 2020 17:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 334F32313B
	for <intel-gfx@archiver.kernel.org>; Sun, 13 Dec 2020 17:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 334F32313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC5189F27;
	Sun, 13 Dec 2020 17:23:15 +0000 (UTC)
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B120489F27
 for <intel-gfx@lists.freedesktop.org>; Sun, 13 Dec 2020 17:23:13 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id B3EEC200418C
 for <intel-gfx@lists.freedesktop.org>; Sun, 13 Dec 2020 17:23:11 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="REkLFnvj"
Date: Sun, 13 Dec 2020 17:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607880185;
 bh=3lyUOONU7YFbM1Vrr6R7EXViemuG9mM/B+itu1MjRQg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=REkLFnvj9JVv6IrVuV91VVHMBFIyALV6lQn4RdKGicYaTV3ns1Bc7cZ1IIghhuDdn
 OCV9B71ANZrHweftS+vuv0bHpSepYx3V8witaDQZJW9bgvNCePiAUDRTxEuSsJwthd
 ik2WVB2HzhSzSjrNlaYld7OsG3UT/WdJzRgl1ZOXb/9mML2tgGcPJvSN12kAOF+xCk
 vVxowv/1j0Yrr8/bz0taOlxyZpNQNq4k9RKD1hQrGiWtM7vneUiqTWbB0IfOnYyn0j
 gbBfw1BMElbUsp5vXDWVLSPwnEptoGnQC7kkW+0J/7337w4s6cyoLDETZp0ctkKQSy
 xeMI0lgjQlyrQ==
To: =?utf-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <N8LaQsFFQKXyJWEc_Abvsw7vF3HIkLo4H7wsMHwL0DoHw6zLpYEhvb7tb8AFpH_0fC8whnF_R8uBwlAHc2aBKcYhgHOZ-V76qhgS2L8YPfU=@emersion.fr>
In-Reply-To: <20201213170728.290406-1-jose.souza@intel.com>
References: <20201213170728.290406-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/damage_helper: Check if damage clips
 has valid values
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: intel-gfx@lists.freedesktop.org, Deepak Rawat <drawat@vmware.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Can you add some drm_dbg_atomic logs when the damage is invalid, to make it
easier for user-space to understand why an atomic commit failed?
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
