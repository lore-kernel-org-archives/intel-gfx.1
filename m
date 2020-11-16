Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E58C55ABD
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 09:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F67D238E6
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 09:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F67D238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8489C94;
	Mon, 16 Nov 2020 09:35:36 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B8489D7C
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 09:35:35 +0000 (UTC)
Date: Mon, 16 Nov 2020 09:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605519333;
 bh=dhwOahqEPL+WR5vz2OGNgjfAgyhUBTkuqshmZlxWbdk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=SDhqm2iYm3evOXG/H3pOzjlqSf/TqY8iN7Zb+724wR7+TOo84+GZ6K47bZj4y9rvA
 au4RW3pa/p7lxvtDEOjwBBuZYi2C0hJlkrcEWozdhdtu8/cmTxZarIZUugmzJCSdpN
 0d9AZ5AJzqnMTQpP4tQyUCTy5Z/KvuipeGSb9juU61uY1rJff+H01bqiFjxfAtzr7d
 24wAOKNiWBTA1Iuh/pR1r7PzzuSaztGaGxOhBH9QhprXgY6kD4/TtDjld8LMjJ26LA
 3dGBZ7PN9w6oOVJ76RPuG8gKs398AHa7c8DRCcyvBpqQhrhSlV8muHhCqcCfQiN5NN
 Q8UNtDeZMnLtw==
To: Dan Carpenter <dan.carpenter@oracle.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <2fwOpqTWf-nLfb3LIICb8wGICvPCGF0BBMVH2sA2YYNddUjKhFYSzHEq39p2WonBgP4LYE2wb3OnPc-_WtpWGUcgdB3lRy3UtjcsQUFdIY4=@emersion.fr>
In-Reply-To: <20201116093340.GW29398@kadam>
References: <20201116093340.GW29398@kadam>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [drm-tip:drm-tip 1117/1129]
 drivers/gpu/drm/drm_atomic_uapi.c:342 drm_atomic_set_crtc_for_connector()
 error: we previously assumed 'crtc' could be null (see line 326)
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "kbuild@lists.01.org" <kbuild@lists.01.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Already fixed in 0003b687ee6d ("drm: fix oops in drm_atomic_set_crtc_for_connector"). Thanks.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
