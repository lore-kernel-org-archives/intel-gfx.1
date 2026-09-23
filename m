Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0207C9830C
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EF210F0AD;
	Wed, 23 Sep 2026 14:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TroCqQXZ";
	dkim-atps=neutral
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com
 [74.125.227.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F89410EF1B
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 07:04:05 +0000 (UTC)
Received: by mail-pj2-f13.google.com with SMTP id
 d9443c01a7336-2d747ed6d6eso3520555ad.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790147045; x=1790751845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=28LBVb7sQliLk2qYNv8ldKxvaKLQWjPAUNF+mEIsBHI=;
 b=TroCqQXZK5AZOBEKVcllV6RQVZTe+2WGRu+hMUycq+2xtTh4np9vrrvjxr0PLpH/D+
 HQP4CFkHcqA84zVEvcZDzq7LntQJ5iWdh75Dp14vEA8HbV0flCdnnbin2Tn+qZJJ2UGc
 4ryx0zIie+kV4PgNva/f8QvtcWGA93/ra0a991jkm19X69TUfhTn7z70Juq8wOtTbhj/
 A7ZtMiB25wyrI2OXK1OE+xeIxM7qnzYZXkXVd+jFVb4pAivr9DgDr/PFgD/PG+obAIov
 A+j72Mmx3OYu8AOmrkAfJ+CrUH0gOo2eHoLJU8RVyZye9YXW18LK+ICM1nNIHuYhjC+R
 IUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790147045; x=1790751845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=28LBVb7sQliLk2qYNv8ldKxvaKLQWjPAUNF+mEIsBHI=;
 b=H+BD2rmnevjbqqVy6xYwra6oTpI9+UDjf8T49ds2gpN6isrU98/Rl+MXubtGrD+HMw
 +UgoMzZphg4PE2m7TpmUVkrg/yLkKBeREB/ttQE1rhmt/kX3CdIxp0y0JSEWzrLzzeTh
 LtItZGpf8M9oF2LckOuWRZ6VlysOucq04IymJYw4JO4PYemqrogfF00Ji6gJiHmHobrX
 bTaZXyGyKwbEX6NNZXRZK3oFbK4oFr6ZDR1VQivtAPDdANj/Kw/Xs9xCboPIveKVXzTQ
 NBvWxoXMQ9zzeQpUmhXJZMEqVKRiF7tkXRATjmr3uFKiPuh3r6wDF2wNZGgV0sKgtW4u
 LycQ==
X-Gm-Message-State: AFuF++nBnmQ3gS49cbl7/oaA5cCmF4g4O2lrEpguWmccXt9OlzpMMOFI
 yST28l3CdDKc0FPq61CZ+v2Sc+fZ3EEgLIZfMLUiWb7cblcZ0vD+Y1u2
X-Gm-Gg: AYBFou3iTa9suMLI0jM6FOzUgSthf5qhv+lQwpCtBFR0WXE8TLXw/58E4Fnq+q7S60F
 PId2AvMRrX7MzjWhmhAHQ82Vj0Ua5lQNcufsFOm0fJFWK3LLcT4kJKHS/dTItZ5xdvcA4OiyXjQ
 TKJXXHhMqKqwccgZrPyMh2Lwhf29+lLoQpIBsijUSmpnn6PjDsKe3B/jMWGXDEyvLxOWWTHJgB5
 4aHWYo4SbxKAhqUBhhLmMrI7xPxbHBU+aKzxiDP5mDqBrXCt+WiZIlCQ1XrPBDykudXrHrqY+hB
 b0R02KHlOcRGvJMpCIdjYfUePqw57jWGKK9fCXl8R/kJKJLqBwzPdF+fsLZvOZBFyBzdHj5YgJh
 +60cLuGNRc2fwQTsMsYLINsExOX1J+YPIVh3esP4h1rbKsn6kCizsWQUCNOlyGgvv1wPWCNt5BR
 +PyDnfuba2lkl6VAkBgr1UFvCHEDp4VOASOeHKsbV7ZHh3TBMZQD1UjJorzUfFeGROR6YrGFS71
 OG9BNMWyWVQg7QJi+oaCvKuoEnqWHiCc2Few5BeHjgjbq7+VPFOT1YpFGNyEQW8Sj97nUPbQP8P
 l22J0vrMfNH648EkTxQmYHCQs5HPOGPonP7EOs6BfB+Yd+/bsQv+lx3ItEI43A==
X-Received: by 2002:a17:903:245:b0:2db:63cb:1b17 with SMTP id
 d9443c01a7336-2df69d3515dmr15195935ad.18.1790147044903; 
 Wed, 23 Sep 2026 00:04:04 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a5a4dafsm5959455ad.24.2026.09.23.00.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 00:04:04 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: size shmem writeback budget to the object
Date: Wed, 23 Sep 2026 15:04:01 +0800
Message-ID: <179014701977.1658553.16622035964431254845.budget@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915062924.2410550-1-matthias.goergens@gmail.com>
References: <20260915062924.2410550-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:21 +0000
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

A gentle ping on this fix. CI appears to have stopped because my address
isn't on the allowlist; could a project owner trigger a retest?

https://patchwork.freedesktop.org/series/174152/

I'd also appreciate review when someone has a chance.

Thanks,
Matthias
